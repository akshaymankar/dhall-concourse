let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.StepHooks JSON.Type → Types.JSONObject
    = λ(hooks : Types.StepHooks JSON.Type) →
        RenderOptional.textOptionalJSONMap
          (toMap hooks : List { mapKey : Text, mapValue : Optional JSON.Type })

in  render
