let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let inParallelStep
    : Types.InParallelStep Types.Step → Types.Step
    = λ(parallelSteps : Types.InParallelStep Types.Step) →
        ./inParallelWithHooks.dhall
          parallelSteps
          (Defaults.StepHooks Types.Step)

in  inParallelStep
