let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Prelude = ../lib/prelude/package.dhall

in    λ(name : Text)
    → λ(deployment : Text)
    →     Defaults.Resource
        ⫽ { name = name
          , type = ../resource-types/bosh-deployment.dhall
          , source =
              Some
              [ Prelude.JSON.keyText "deployment" deployment
              , Prelude.JSON.keyText "skip_check" "true"
              ]
          }
      : Concourse.Resource
