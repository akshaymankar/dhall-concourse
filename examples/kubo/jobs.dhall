let Job = ./../../types/Job.dhall

let defaults = ./../../defaults.dhall

let Step = ./../../types/Step.dhall

let BasicStep = ./../../types/BasicStep.dhall

let ResourceType = ./../../types/ResourceType.dhall

let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Resource = ./../../types/Resource.dhall

let TaskConfig = ./../../types/TaskConfig.dhall

let gitKuboCI
	: Resource
	=   defaults.Resource
	  ⫽ { name =
			"git-kubo-ci"
		, type =
			ResourceType.InBuilt "git"
		, source =
			Some
			[ Prelude.JSON.keyText
			  "uri"
			  "git@github.com:cloudfoundry-incubator/kubo-ci"
			, Prelude.JSON.keyText "branch" "master"
			, Prelude.JSON.keyText "privateKey" "((git-ssh-key.private_key))"
			]
		}

let gitKuboRelease
	: Resource
	=   defaults.Resource
	  ⫽ { name =
			"git-kubo-release"
		, type =
			ResourceType.InBuilt "git"
		, source =
			Some
			[ Prelude.JSON.keyText
			  "uri"
			  "git@github.com:cloudfoundry-incubator/kubo-release"
			, Prelude.JSON.keyText "branch" "master"
			, Prelude.JSON.keyText "privateKey" "((git-ssh-key.private_key))"
			]
		}

let getKuboCI
	: BasicStep
	= BasicStep.Get (defaults.GetStep ⫽ { resource = gitKuboCI })

let getKuboRelease
	: BasicStep
	= BasicStep.Get (defaults.GetStep ⫽ { resource = gitKuboRelease })

let buildKuboRelease
	: BasicStep
	= BasicStep.Task
	  (   defaults.TaskStep
		⫽ { task =
			  "build-kubo-release"
		  , config =
			  TaskConfig.File "git-kubo-ci/tasks/build-kubo-release.yml"
		  }
	  )

let gcsKuboRelease
	: Resource
	=   defaults.Resource
	  ⫽ { name =
			"gcs-kubo-release"
		, type =
			./../../resource-types/GcsResource.dhall
		, source =
			Some
			[ Prelude.JSON.keyText "bucket" "kubo-releases"
			, Prelude.JSON.keyText "json_key" "((gcs-json-key))"
			, Prelude.JSON.keyText "regexp" "kubo-release-(.*).tgz"
			]
		}

let uploadReleaseTarball
	: BasicStep
	= BasicStep.Put (defaults.PutStep ⫽ { resource = gcsKuboRelease })

in  [   defaults.Job
	  ⫽ { name =
			"first job"
		, plan =
			[ Step.Aggregate [ getKuboCI, getKuboRelease ]
			, Step.Basic buildKuboRelease
			, Step.Basic uploadReleaseTarball
			]
		}
	] : List Job