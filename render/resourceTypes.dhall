let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let JSON = Prelude.JSON

let catOptionals
    : ∀(T : Type) → List (Optional T) → List T
    = λ(T : Type) →
      λ(ts : List (Optional T)) →
        List/fold
          (Optional T)
          ts
          (List T)
          ( λ(t : Optional T) →
            λ(acc : List T) →
              Prelude.List.concat T [ Prelude.Optional.toList T t, acc ]
          )
          ([] : List T)

let catOptionalJSONs =
      λ(js : List (Optional JSON.Type)) → JSON.array (catOptionals JSON.Type js)

let render
    : List Types.ResourceType → JSON.Type
    = λ(rs : List Types.ResourceType) →
        catOptionalJSONs
          ( Prelude.List.map
              Types.ResourceType
              (Optional JSON.Type)
              ./resourceType.dhall
              rs
          )

in  render
