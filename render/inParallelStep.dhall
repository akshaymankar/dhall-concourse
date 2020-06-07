let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let renderSteps = λ(steps : List JSON.Type) → JSON.array steps

let renderConfig =
      λ(config : Types.InParallelConfig JSON.Type) →
        JSON.object
          ( toMap
              { steps = JSON.array config.steps
              , limit = RenderOptional.natural config.limit
              , fail_fast = RenderOptional.bool config.fail_fast
              }
          )

let render
    : Types.InParallelStep JSON.Type → Types.JSONObject
    = λ(p : Types.InParallelStep JSON.Type) →
        toMap
          { in_parallel = merge { Steps = renderSteps, Config = renderConfig } p
          }

in  render
