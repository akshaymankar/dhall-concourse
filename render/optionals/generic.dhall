let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let optionalToJSON
    : ∀(T : Type) → (T → JSON.Type) → Optional T → JSON.Type
    = λ(T : Type) →
      λ(toJSON : T → JSON.Type) →
      λ(thing : Optional T) →
        Prelude.Optional.fold T thing JSON.Type toJSON JSON.null

in  optionalToJSON
