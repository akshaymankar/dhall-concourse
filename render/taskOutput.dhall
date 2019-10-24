let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.TaskOutput → JSON.Type
    =   λ(o : Types.TaskOutput)
      → JSON.object
          ( toMap
              { name = JSON.string o.name, path = RenderOptional.text o.path }
          )

in  render
