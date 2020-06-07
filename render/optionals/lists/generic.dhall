let Prelude = ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let render
    : ∀(T : Type) → (T → JSON.Type) → Optional (List T) → JSON.Type
    = λ(T : Type) →
      λ(f : T → JSON.Type) →
        ../generic.dhall
          (List T)
          (λ(xs : List T) → JSON.array (Prelude.List.map T JSON.Type f xs))

in  render
