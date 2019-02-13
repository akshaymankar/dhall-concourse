let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Helpers =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/helpers/package.dhall sha256:62436917421b315a508d108d7dcceb4976570fff94b7ae95bf2fc8f21729c930

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let upstreamJobs = [ ./build-kubo-release.dhall ]

let passed = Some upstreamJobs

let getKuboDeployment = ../steps/get-kubo-deployment.dhall (None Bool) passed

let getKuboRelease = ../steps/get-kubo-release.dhall (None Bool) passed

let getKuboVersion =
	  Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/kubo-version.dhall
		  , passed =
			  Some (../utils/job-names.dhall upstreamJobs)
		  }
	  )

let buildKuboDeploymentTarball =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "build-kubo-deployment-tarball"
		  , config =
			  Concourse.TaskSpec.File
			  "git-kubo-ci/tasks/build-kubo-deployment-tarball.yml"
		  }
	  )

let putKuboDeploymentTarballUntested =
	  Helpers.putStep
	  (   Defaults.PutStep
		⫽ { resource =
			  ../resources/gcs-kubo-deployment-tarball-untested.dhall
		  , params =
			  Some
			  [ Prelude.JSON.keyText
				"file"
				"kubo-deployment-tarball/kubo-deployment*.tgz"
			  ]
		  }
	  )

in    Defaults.Job
	⫽ { name =
		  "package-kubo-deployment-tarball"
	  , plan =
		  [ Helpers.aggregateStep
			[ ../steps/get-slackers.dhall
			, ../steps/get-kubo-ci.dhall
			, getKuboDeployment
			, getKuboRelease
			, getKuboVersion
			]
		  , buildKuboDeploymentTarball
		  , putKuboDeploymentTarballUntested
		  ]
	  }