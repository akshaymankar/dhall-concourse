let Types = ../types/package.dhall

in    ( λ(loadVarStep : Types.LoadVarStep) →
        λ(hooks : Types.StepHooks Types.Step) →
        λ(Step : Type) →
        λ(constructors : Types.StepConstructors Step) →
          constructors.load_var
            loadVarStep
            (./translateHooks.dhall Step constructors hooks)
      )
    : Types.LoadVarStep → Types.StepHooks Types.Step → Types.Step
