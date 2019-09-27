let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Prelude = ../lib/prelude/package.dhall

in    λ(name : Text)
    → λ(jsonKey : Text)
    → λ(bucket : Text)
    → λ(regexp : Text)
    →     Defaults.Resource
        ⫽ { name = name
          , type = ../resource-types/gcs.dhall
          , source =
              Some
              [ Prelude.JSON.keyText "json_key" jsonKey
              , Prelude.JSON.keyText "bucket" bucket
              , Prelude.JSON.keyText "regexp" regexp
              ]
          }
      : Concourse.Resource
