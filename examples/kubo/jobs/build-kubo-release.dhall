let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Helpers =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/helpers/package.dhall sha256:62436917421b315a508d108d7dcceb4976570fff94b7ae95bf2fc8f21729c930

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let getKuboDeployment =
	  ../steps/get-kubo-deployment.dhall
	  (Some True)
	  (Some [ ./run-unit-tests.dhall ])

let getKuboRelease =
	  ../steps/get-kubo-release.dhall
	  (Some True)
	  (Some [ ./run-unit-tests.dhall ])

let getGafferSourceJSON =
	  Helpers.getStep
	  (Defaults.GetStep ⫽ { resource = ../resources/gaffer-source-json.dhall })

let getKuboVersion =
	  Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/kubo-version.dhall
		  , params =
			  Some [ Prelude.JSON.keyText "pre" "dev" ]
		  }
	  )

let buildKuboRelease =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "build-kubo-release"
		  , config =
			  Concourse.TaskSpec.File "git-kubo-ci/tasks/build-kubo-release"
		  }
	  )

let generateCompilationManifest =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "generate-compilation-manifest"
		  , config =
			  Concourse.TaskSpec.File
			  "git-kubo-ci/tasks/generate-compilation-manifest.yml"
		  }
	  )

let putCompilationDeployment =
	  Helpers.putStep
	  (   Defaults.PutStep
		⫽ { resource =
			  ../resources/compilation-deployment.dhall
		  , params =
			  Some
			  [ Prelude.JSON.keyText
				"manifest"
				"compilation-manifest/manifest.yml"
			  , Prelude.JSON.keyText
				"source_file"
				"gaffer-source-json/source.json"
			  , Prelude.JSON.keyText
				"releases"
				"kubo-release/kubo-release-*.tgz"
			  ]
		  }
	  )

let export =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "export"
		  , config =
			  Concourse.TaskSpec.File "git-kubo-ci/tasks/export-release.yml"
		  , params =
			  Some [ Prelude.JSON.keyText "RELEASE_LIST" "kubo" ]
		  , input_mapping =
			  Some
			  [ Prelude.JSON.keyText "gcs-source-json" "gaffer-source-json" ]
		  }
	  )

let putKuboVersion =
	  Helpers.putStep
	  (   Defaults.PutStep
		⫽ { resource =
			  ../resources/kubo-version.dhall
		  , params =
			  Some [ Prelude.JSON.keyText "pre" "dev" ]
		  }
	  )

let putKuboReleaseTarballUntested =
	  Helpers.putStep
	  (   Defaults.PutStep
		⫽ { resource =
			  ../resources/gcs-kubo-release-tarball-untested.dhall
		  , params =
			  Some
			  [ Prelude.JSON.keyText "file" "compiled-releases/kubo-*.tgz" ]
		  }
	  )

in    Defaults.Job
	⫽ { name =
		  "build-kubo-release"
	  , plan =
		  [ Helpers.aggregateStep
			[ ../steps/get-slackers.dhall
			, ../steps/get-kubo-ci.dhall
			, getKuboDeployment
			, getKuboRelease
			, getKuboVersion
			]
		  , buildKuboRelease
		  , generateCompilationManifest
		  , putCompilationDeployment
		  , export
		  , putKuboVersion
		  , putKuboReleaseTarballUntested
		  ]
	  }