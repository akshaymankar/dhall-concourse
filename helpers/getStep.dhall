let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

in    (   λ(getStep : Types.GetStep)
        → λ(Step : Type)
        → λ(constructors : Types.StepConstructors Step)
        → constructors.get getStep (Defaults.StepHooks Step)
      )
    : Types.GetStep → Types.Step
