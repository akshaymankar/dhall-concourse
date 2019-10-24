let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let Types = ../../types/package.dhall

let TextOptionalJSON = { mapKey : Text, mapValue : Optional JSON.Type }

let TextJSON = { mapKey : Text, mapValue : JSON.Type }

let id = λ(x : JSON.Type) → x

let renderPair
    : TextOptionalJSON → TextJSON
    =   λ(p : TextOptionalJSON)
      →   p
        ⫽ { mapValue =
              ./generic.dhall JSON.Type id (p.mapValue : Optional JSON.Type)
          }

let renderMap
    : List TextOptionalJSON → Types.JSONObject
    = Prelude.List.map TextOptionalJSON TextJSON renderPair

in  renderMap
