let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let TextJSONPair = { mapKey : Text, mapValue : JSON.Type }

let concatJSONs =
        λ(xs : List Types.JSONObject)
      → JSON.object (Prelude.List.concat TextJSONPair xs)

let renderGet =
        λ(get : Types.GetStep)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ ./getStep.dhall get, ./stepHooks.dhall hooks ]

let renderPut =
        λ(put : Types.PutStep)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ ./putStep.dhall put, ./stepHooks.dhall hooks ]

let renderTask =
        λ(task : Types.TaskStep)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ ./taskStep.dhall task, ./stepHooks.dhall hooks ]

let renderSetPipeline =
        λ(s : Types.SetPipelineStep)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ ./setPipelineStep.dhall s, ./stepHooks.dhall hooks ]

let renderAggregate =
        λ(steps : List JSON.Type)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs
          [ toMap { aggregate = JSON.array steps }, ./stepHooks.dhall hooks ]

let renderDo =
        λ(steps : List JSON.Type)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ toMap { do = JSON.array steps }, ./stepHooks.dhall hooks ]

let renderTry =
        λ(step : JSON.Type)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ toMap { try = step }, ./stepHooks.dhall hooks ]

let renderInParallel =
        λ(config : Types.InParallelStep JSON.Type)
      → λ(hooks : Types.StepHooks JSON.Type)
      → concatJSONs [ ./inParallelStep.dhall config, ./stepHooks.dhall hooks ]

let render
    : Types.Step → JSON.Type
    =   λ(step : Types.Step)
      → step
          JSON.Type
          { get = renderGet
          , put = renderPut
          , task = renderTask
          , set_pipeline = renderSetPipeline
          , aggregate = renderAggregate
          , do = renderDo
          , try = renderTry
          , in_parallel = renderInParallel
          }

in  render
