let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let render
    : Types.TaskCache → JSON.Type
    = λ(c : Types.TaskCache) → JSON.object (toMap { path = JSON.string c.path })

in  render
