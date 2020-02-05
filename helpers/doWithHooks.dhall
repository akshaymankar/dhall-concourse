let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let doStep
    : List Types.Step → Types.StepHooks Types.Step → Types.Step
    =   λ(steps : List Types.Step)
      → λ(hooks : Types.StepHooks Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix =
              Prelude.List.map
                Types.Step
                Step
                (λ(s : Types.Step) → s Step constructors)
                steps

        in  constructors.do
              stepTypeFix
              (./translateHooks.dhall hooks Step constructors)

in  doStep
