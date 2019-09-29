let Defaults = ../defaults/package.dhall

let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

in      Defaults.Resource
      ⫽ { name = "gcs-some-file"
        , type = ./../resource-types/GcsResource.dhall
        , source =
            Some
            [ { mapKey = "bucket"
              , mapValue = Prelude.JSON.string "my-awesome-bucket"
              }
            , { mapKey = "json_key"
              , mapValue = Prelude.JSON.string "super-secret-json"
              }
            ]
        }
    : Types.Resource
