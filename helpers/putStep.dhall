let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let putStep
    : Types.PutStep → Types.Step
    =   λ(putStep : Types.PutStep)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → constructors.put putStep (Defaults.StepHooks Step)

in  putStep
