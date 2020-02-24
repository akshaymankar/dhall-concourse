let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let setPipelineStep
    : Types.SetPipelineStep → Types.Step
    =   λ(s : Types.SetPipelineStep)
      → ./setPipelineStepWithHooks.dhall s (Defaults.StepHooks Types.Step)

in  setPipelineStep
