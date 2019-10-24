let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let render
    : List Text → JSON.Type
    =   λ(xs : List Text)
      → JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  render
