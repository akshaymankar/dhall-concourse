let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let putStep
    : Types.PutStep → Types.Step
    = λ(putStep : Types.PutStep) →
        ./putWithHooks.dhall putStep (Defaults.StepHooks Types.Step)

in  putStep
