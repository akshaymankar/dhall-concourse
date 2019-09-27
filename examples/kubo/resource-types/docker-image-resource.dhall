let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Prelude = ../lib/prelude/package.dhall

let JSON = ../lib/prelude/json-type.dhall

let JSONHelpers = ../lib/prelude/json-helpers.dhall

in    λ(name : Text)
    → λ(repository : Text)
    → λ(tag : Text)
    →   Concourse.ResourceType.Custom
          (   Defaults.CustomResourceType
            ⫽ { name =
                  name
              , type =
                  "docker-image"
              , source =
                  Some
                  [ JSONHelpers.keyValue
                      JSON
                      "repository"
                      (JSONHelpers.string repository)
                  , JSONHelpers.keyValue JSON "tag" (JSONHelpers.string tag)
                  ]
              }
          )
      : Concourse.ResourceType
