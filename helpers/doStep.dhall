let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let doStep
    : List Types.Step → Types.Step
    =   λ(steps : List Types.Step)
      → ./doWithHooks.dhall steps (Defaults.StepHooks Types.Step)

in  doStep
