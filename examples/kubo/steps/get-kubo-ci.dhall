let Defaults = ../lib/dhall-concourse/defaults.dhall

let Helpers = ../lib/dhall-concourse/helpers.dhall

in  Helpers.getStep
      (Defaults.GetStep ⫽ { resource = ../resources/git-kubo-ci.dhall })
