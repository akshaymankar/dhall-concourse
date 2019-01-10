let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:e650572bc57dd08b210ee556a47dc73528b10d15646517c924fcd34d7dc7c05d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:c8d049dbb874ec4c853d2b481a34c5cf5aa63fb2e498a48ada5a11044062f741

let versionResource
	: Concourse.Resource
	=   Defaults.Resource
	  ⫽ { name =
			"acme-version"
		, type =
			Concourse.ResourceType.InBuilt "semver"
		, source =
			Some
			[ { mapKey = "driver", mapValue = "gcs" }
			, { mapKey = "key", mapValue = "versions/acme-version" }
			, { mapKey = "bucket", mapValue = "acme-bucket" }
			]
		}

in  versionResource