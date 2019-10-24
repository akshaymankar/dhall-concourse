let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let textToJSON
    : Optional Text → JSON.Type
    = ./generic.dhall Text JSON.string

in  textToJSON
