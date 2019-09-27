let Types = ../types/package.dhall

in    Types.ResourceType.Custom
        { name =
            "gcs"
        , type =
            "docker-image"
        , source =
            Some
            [ { mapKey = "repository", mapValue = "frodenas/gcs-resource" } ]
        }
    : Types.ResourceType
