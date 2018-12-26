let defaults = ./../defaults.dhall

let Types = ./../types/package.dhall

in      defaults.Resource
	  ⫽ { name =
			"gcs-some-file"
		, type =
			./../resource-types/GcsResource.dhall
		, source =
			Some
			[ { mapKey = "bucket", mapValue = "my-awesome-bucket" }
			, { mapKey = "json_key", mapValue = "super-secret-json" }
			]
		}
	: Types.Resource