let ResourceType = ./../types/ResourceType.dhall

in    ResourceType.Custom
	  { name =
		  "gcs"
	  , type =
		  "docker-image"
	  , source =
		  Some [ { mapKey = "repository", mapValue = "frodenas/gcs-resource" } ]
	  }
	: ./../types/ResourceType.dhall