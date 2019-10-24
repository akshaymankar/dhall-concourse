let generic = ./generic.dhall

let JSON = (../../lib/prelude.dhall).JSON

in  { generic = generic
    , bool = generic Bool JSON.bool
    , jsonObject = ./json-object.dhall
    , text = generic Text JSON.string
    , natural = ./natural.dhall
    , lists = ./lists/package.dhall
    , textTextMap = ./text-text-map.dhall
    , textOptionalJSONMap = ./text-optional-json-map.dhall
    }
