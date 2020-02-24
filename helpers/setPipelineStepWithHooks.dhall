let Types = ../types/package.dhall

in    (   λ(setPipelineStep : Types.SetPipelineStep)
        → λ(hooks : Types.StepHooks Types.Step)
        → λ(Step : Type)
        → λ(constructors : Types.StepConstructors Step)
        → constructors.set_pipeline
            setPipelineStep
            (./translateHooks.dhall Step constructors hooks )
      )
    : Types.SetPipelineStep → Types.StepHooks Types.Step → Types.Step
