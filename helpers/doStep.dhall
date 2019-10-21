let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let Prelude = ../lib/prelude.dhall

let doStep
    : List Types.Step → Types.Step
    =   λ(steps : List Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix =
              Prelude.List.map
                Types.Step
                Step
                (λ(s : Types.Step) → s Step constructors)
                steps
        
        in  constructors.do stepTypeFix (Defaults.StepHooks Step)

in  doStep
