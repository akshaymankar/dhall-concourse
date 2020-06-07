let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

in    ( λ(getStep : Types.GetStep) →
          ./getWithHooks.dhall getStep (Defaults.StepHooks Types.Step)
      )
    : Types.GetStep → Types.Step
