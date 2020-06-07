let Types = ../types/package.dhall

in    ( λ(putStep : Types.PutStep) →
        λ(hooks : Types.StepHooks Types.Step) →
        λ(Step : Type) →
        λ(constructors : Types.StepConstructors Step) →
          constructors.put
            putStep
            (./translateHooks.dhall Step constructors hooks)
      )
    : Types.PutStep → Types.StepHooks Types.Step → Types.Step
