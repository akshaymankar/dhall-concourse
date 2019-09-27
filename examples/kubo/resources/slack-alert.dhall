let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Prelude = ../lib/prelude/package.dhall

in      Defaults.Resource
      ⫽ { name = "slack-alert"
        , type = ./../resource-types/slack-notification.dhall
        , source =
            Some [ Prelude.JSON.keyText "url" "((build-alert-slack-url))" ]
        }
    : Concourse.Resource
