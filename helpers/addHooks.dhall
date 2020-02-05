let Types = ../types/package.dhall

let Step = Types.Step

let StepHooks = Types.StepHooks

let addHooks
    : Step → StepHooks Step → Step
    =   λ(theStep : Step)
      → λ(hooks : StepHooks Step)
      → theStep
          Step
          { get =
                λ(g : Types.GetStep)
              → λ(_ : StepHooks Step)
              → ./getWithHooks.dhall g hooks
          , put =
                λ(p : Types.PutStep)
              → λ(_ : StepHooks Step)
              → ./putWithHooks.dhall p hooks
          , task =
                λ(t : Types.TaskStep)
              → λ(_ : StepHooks Step)
              → ./taskWithHooks.dhall t hooks
          , aggregate =
                λ(steps : List Step)
              → λ(_ : StepHooks Step)
              → ./aggregateWithHooks.dhall steps hooks
          , in_parallel =
                λ(steps : Types.InParallelStep Step)
              → λ(_ : StepHooks Step)
              → ./inParallelWithHooks.dhall steps hooks
          , do =
                λ(steps : List Step)
              → λ(_ : StepHooks Step)
              → ./doWithHooks.dhall steps hooks
          , try =
                λ(step : Step)
              → λ(_ : StepHooks Step)
              → ./tryWithHooks.dhall step hooks
          }

in  addHooks
