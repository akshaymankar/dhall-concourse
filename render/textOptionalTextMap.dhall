let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let Types = ../types/package.dhall

let TextJSONPair = { mapKey : Text, mapValue : JSON.Type }

let TextOptionalTextPair = { mapKey : Text, mapValue : Optional Text }

let RenderOptional = ./optionals/package.dhall

let renderPair
    : TextOptionalTextPair → TextJSONPair
    = λ(p : TextOptionalTextPair) →
        p ⫽ { mapValue = RenderOptional.text p.mapValue }

let renderTextTextMap
    : List TextOptionalTextPair → Types.JSONObject
    = Prelude.List.map TextOptionalTextPair TextJSONPair renderPair

in  renderTextTextMap
