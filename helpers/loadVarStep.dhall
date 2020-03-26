let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let loadVarStep
    : Types.LoadVarStep → Types.Step
    =   λ(l : Types.LoadVarStep)
      → ./loadVarStepWithHooks.dhall l (Defaults.StepHooks Types.Step)

in  loadVarStep
