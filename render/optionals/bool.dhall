let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let optionalToJSON = ./generic.dhall

let boolToJSON
    : Optional Bool → JSON.Type
    = optionalToJSON Bool JSON.bool

in  boolToJSON
