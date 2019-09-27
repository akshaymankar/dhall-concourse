let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Prelude = ../lib/prelude/package.dhall

in    λ(env : Text)
    →     Defaults.Resource
        ⫽ { name = "kubo-lock-${env}"
          , type = Concourse.ResourceType.InBuilt "pool"
          , source =
              Some
              [ Prelude.JSON.keyText
                  "source"
                  "git@github.com:pivotal-cf-experimental/kubo-locks.git"
              , Prelude.JSON.keyText "branch" "master"
              , Prelude.JSON.keyText "private_key" "((git-ssh-key.private_key))"
              , Prelude.JSON.keyText "pool" "kubo-${env}"
              ]
          }
      : Concourse.Resource
