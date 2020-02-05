let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let tryStep
    : Types.Step → Types.Step
    =   λ(step : Types.Step)
      → ./tryWithHooks.dhall step (Defaults.StepHooks Types.Step)

in  tryStep
