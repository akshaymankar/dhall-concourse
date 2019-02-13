let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Helpers =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/helpers/package.dhall sha256:384962d223b7a61a7d02ae56aeb7f931a924e2b64ce4f6d156375801af574841

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let getKuboDeployment =
	  ../steps/get-kubo-deployment.dhall (None Bool) (None (List Concourse.Job))

let getKuboRelease =
	  ../steps/get-kubo-release.dhall (None Bool) (None (List Concourse.Job))

let runReleaseUnitTests =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "run-release-unit-tests"
		  , config =
			  Concourse.TaskSpec.File
			  "git-kubo-ci/tasks/run-release-unit-tests.yml"
		  }
	  )

let runDeploymentUnitTests =
	  Helpers.taskStep
	  (   Defaults.TaskStep
		⫽ { task =
			  "run-deployment-unit-tests"
		  , config =
			  Concourse.TaskSpec.File
			  "git-kubo-ci/tasks/run-deployment-unit-tests.yml"
		  }
	  )

in    Defaults.Job
	⫽ { name =
		  "run-unit-tests"
	  , plan =
		  [ ../steps/get-slackers.dhall
		  , ../steps/get-kubo-ci.dhall
		  , getKuboDeployment
		  , getKuboRelease
		  , runReleaseUnitTests
		  , runDeploymentUnitTests
		  ]
	  }