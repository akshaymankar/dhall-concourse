let Types = ../types/package.dhall

let JSON = (../lib/prelude.dhall).JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.TaskRunConfig → JSON.Type
    = λ(c : Types.TaskRunConfig) →
        JSON.object
          ( toMap
              { path = JSON.string c.path
              , args = RenderOptional.lists.text c.args
              , dir = RenderOptional.text c.dir
              , user = RenderOptional.text c.user
              }
          )

in  render
