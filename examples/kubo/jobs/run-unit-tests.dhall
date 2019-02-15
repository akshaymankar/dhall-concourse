let Concourse =
	  ../lib/dhall-concourse/types.dhall

let Defaults =
	  ../lib/dhall-concourse/defaults.dhall

let Helpers =
	  ../lib/dhall-concourse/helpers.dhall

let Prelude =
	  ../lib/prelude/package.dhall

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