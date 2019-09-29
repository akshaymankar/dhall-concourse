let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let Prelude = ../lib/prelude.dhall

in    Types.ResourceType.Custom
        (   Defaults.CustomResourceType
          ⫽ { name = "gcs"
            , type = "docker-image"
            , source =
                Some
                [ { mapKey = "repository"
                  , mapValue = Prelude.JSON.string "frodenas/gcs-resource"
                  }
                ]
            }
        )
    : Types.ResourceType
