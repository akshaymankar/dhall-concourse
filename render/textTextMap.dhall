let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let Types = ../types/package.dhall

let TextJSONPair = { mapKey : Text, mapValue : JSON.Type }

let renderTextTextPair
    : Types.TextTextPair → TextJSONPair
    = λ(p : Types.TextTextPair) → p ⫽ { mapValue = JSON.string p.mapValue }

let renderTextTextMap
    : List Types.TextTextPair → Types.JSONObject
    = Prelude.List.map Types.TextTextPair TextJSONPair renderTextTextPair

in  renderTextTextMap
