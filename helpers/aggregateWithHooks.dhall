let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

in    (   λ(steps : List Types.Step)
        → λ(hooks : Types.StepHooks Types.Step)
        → λ(Step : Type)
        → λ(constructors : Types.StepConstructors Step)
        → let stepTypeFix =
                Prelude.List.map
                  Types.Step
                  Step
                  (λ(s : Types.Step) → s Step constructors)
                  steps

          in  constructors.aggregate
                stepTypeFix
                (./translateHooks.dhall hooks Step constructors)
      )
    : List Types.Step → Types.StepHooks Types.Step → Types.Step
