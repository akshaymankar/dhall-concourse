let Concourse =
	  ../lib/dhall-concourse/types.dhall

let Defaults =
	  ../lib/dhall-concourse/defaults.dhall

let Prelude =
	  ../lib/prelude/package.dhall

in      Defaults.Resource
	  ⫽ { name =
			"kubo-version"
		, type =
			Concourse.ResourceType.InBuilt "semver"
		, source =
			Some
			[ Prelude.JSON.keyText "driver" "gcs"
			, Prelude.JSON.keyText "key" "versions/kubo-version"
			, Prelude.JSON.keyText "json_key" "((gcs-json-key))"
			, Prelude.JSON.keyText "bucket" "kubo-pipeline-store"
			]
		}
	: Concourse.Resource