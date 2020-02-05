let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let aggregateStep
    : List Types.Step → Types.Step
    =   λ(steps : List Types.Step)
      → ./aggregateWithHooks.dhall steps (Defaults.StepHooks Types.Step)

in  aggregateStep
