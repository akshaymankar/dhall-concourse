let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let Resource = Types.Resource

let StepHooks = Types.StepHooks

let catOptionals = ../utils/catOptionals.dhall

let resourcesFromStepHooks
    : StepHooks (List Resource) → List Resource
    =   λ(h : StepHooks (List Resource))
      → let listOfListOfResources =
              catOptionals
                (List Resource)
                [ h.ensure, h.on_success, h.on_failure, h.on_abort ]
        
        in  Prelude.List.concat Resource listOfListOfResources

let resourcesFromGetStep
    : Types.GetStep → StepHooks (List Resource) → List Resource
    =   λ(g : Types.GetStep)
      → λ(h : StepHooks (List Resource))
      → [ g.resource ] # resourcesFromStepHooks h

let resourcesFromPutStep
    : Types.PutStep → StepHooks (List Resource) → List Resource
    =   λ(p : Types.PutStep)
      → λ(h : StepHooks (List Resource))
      → [ p.resource ] # resourcesFromStepHooks h

let resourcesFromTaskStep
    : Types.TaskStep → StepHooks (List Resource) → List Resource
    =   λ(_ : Types.TaskStep)
      → λ(h : StepHooks (List Resource))
      → resourcesFromStepHooks h

let resourcesFromAggregateOrDo
    : List (List Resource) → StepHooks (List Resource) → List Resource
    =   λ(rs : List (List Resource))
      → λ(h : StepHooks (List Resource))
      → Prelude.List.concat Resource rs # resourcesFromStepHooks h

let resourcesFromInParallelSteps =
      λ(rs : List (List Resource)) → Prelude.List.concat Resource rs

let resourcesFromInParallelConfig =
        λ(config : Types.InParallelConfig (List Resource))
      → Prelude.List.concat Resource config.steps

let resourcesFromInParallel
    :   Types.InParallelStep (List Resource)
      → StepHooks (List Resource)
      → List Resource
    =   λ(step : Types.InParallelStep (List Resource))
      → λ(h : StepHooks (List Resource))
      →   merge
            { Steps = resourcesFromInParallelSteps
            , Config = resourcesFromInParallelConfig
            }
            step
        # resourcesFromStepHooks h

let resourcesFromTry
    : List Resource → StepHooks (List Resource) → List Resource
    =   λ(rs : List Resource)
      → λ(h : StepHooks (List Resource))
      → rs # resourcesFromStepHooks h

let resourcesFromStep =
        λ(s : Types.Step)
      → s
          (List Resource)
          { get = resourcesFromGetStep
          , put = resourcesFromPutStep
          , task = resourcesFromTaskStep
          , aggregate = resourcesFromAggregateOrDo
          , do = resourcesFromAggregateOrDo
          , try = resourcesFromTry
          , in_parallel = resourcesFromInParallel
          }

let resourcesFromJob =
        λ(j : Types.Job)
      → let hookSteps =
              catOptionals
                Types.Step
                [ j.on_abort, j.on_failure, j.on_success, j.ensure ]
        
        in  Prelude.List.concatMap Types.Step Resource resourcesFromStep (j.plan # hookSteps)

in    Prelude.List.concatMap Types.Job Resource resourcesFromJob
    : List Types.Job → List Resource
