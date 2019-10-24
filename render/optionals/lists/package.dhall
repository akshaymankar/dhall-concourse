let Prelude = ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic = ./generic.dhall

in  { generic = generic, text = generic Text JSON.string }
