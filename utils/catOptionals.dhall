let Prelude = ../lib/prelude.dhall

let catOptionals
    : ∀(T : Type) → List (Optional T) → List T
    =   λ(T : Type)
      → λ(ts : List (Optional T))
      → List/fold
          (Optional T)
          ts
          (List T)
          (   λ(t : Optional T)
            → λ(acc : List T)
            → Prelude.List.concat T [ Prelude.Optional.toList T t, acc ]
          )
          ([] : List T)

in  catOptionals
