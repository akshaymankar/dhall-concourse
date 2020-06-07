let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.TaskContainerLimits → JSON.Type
    = λ(l : Types.TaskContainerLimits) →
        JSON.object
          ( toMap
              { cpu = RenderOptional.natural l.cpu
              , memory = RenderOptional.natural l.memory
              }
          )

in  RenderOptional.generic Types.TaskContainerLimits render
