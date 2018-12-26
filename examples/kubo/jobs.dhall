let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../../types/package.dhall

let Defaults = ./../../defaults/package.dhall

let gitKuboCI
	: Types.Resource
	=   Defaults.Resource
	  ⫽ { name =
			"git-kubo-ci"
		, type =
			Types.ResourceType.InBuilt "git"
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
	: Types.Resource
	=   Defaults.Resource
	  ⫽ { name =
			"git-kubo-release"
		, type =
			Types.ResourceType.InBuilt "git"
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
	: Types.BasicStep
	= Types.BasicStep.Get (Defaults.GetStep ⫽ { resource = gitKuboCI })

let getKuboRelease
	: Types.BasicStep
	= Types.BasicStep.Get (Defaults.GetStep ⫽ { resource = gitKuboRelease })

let buildKuboRelease
	: Types.BasicStep
	= Types.BasicStep.Task
	  (   Defaults.TaskStep
		⫽ { task =
			  "build-kubo-release"
		  , config =
			  Types.TaskSpec.File "git-kubo-ci/tasks/build-kubo-release.yml"
		  }
	  )

let gcsKuboRelease
	: Types.Resource
	=   Defaults.Resource
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
	: Types.BasicStep
	= Types.BasicStep.Put (Defaults.PutStep ⫽ { resource = gcsKuboRelease })

in  [   Defaults.Job
	  ⫽ { name =
			"first job"
		, plan =
			[ Types.Step.Aggregate [ getKuboCI, getKuboRelease ]
			, Types.Step.Basic buildKuboRelease
			, Types.Step.Basic uploadReleaseTarball
			]
		}
	] : List Types.Job