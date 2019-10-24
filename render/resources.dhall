let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

in  Prelude.List.map Types.Resource JSON.Type ./resource.dhall
