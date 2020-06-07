let Types = ../types/package.dhall

in    ( λ(steps : List Types.Step) →
        λ(hooks : Types.StepHooks Types.Step) →
        λ(Step : Type) →
        λ(constructors : Types.StepConstructors Step) →
          constructors.aggregate
            (./translateSteps.dhall Step constructors steps)
            (./translateHooks.dhall Step constructors hooks)
      )
    : List Types.Step → Types.StepHooks Types.Step → Types.Step
