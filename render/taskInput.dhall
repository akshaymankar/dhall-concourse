let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.TaskInput → JSON.Type
    =   λ(i : Types.TaskInput)
      → JSON.object
          ( toMap
              { name = JSON.string i.name
              , path = RenderOptional.text i.path
              , optional = RenderOptional.bool i.optional
              }
          )

in  render
