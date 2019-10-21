let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let Prelude = ../lib/prelude.dhall

let aggregateStep
    : List Types.Step → Types.Step
    =   λ(aggregatedSteps : List Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix =
              Prelude.List.map
                Types.Step
                Step
                (λ(s : Types.Step) → s Step constructors)
                aggregatedSteps
        
        in  constructors.aggregate stepTypeFix (Defaults.StepHooks Step)

in  aggregateStep
