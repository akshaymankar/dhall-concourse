let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let Prelude = ../lib/prelude.dhall

in    (   λ(getStep : Types.GetStep)
        → λ(hooks : Types.StepHooks Types.Step)
        → λ(Step : Type)
        → λ(constructors : Types.StepConstructors Step)
        → constructors.get
            getStep
            (./translateHooks.dhall Step constructors hooks)
      )
    : Types.GetStep → Types.StepHooks Types.Step → Types.Step
