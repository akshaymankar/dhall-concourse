let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let tryStep
    : Types.Step → Types.Step
    =   λ(step : Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix = step Step constructors
        
        in  constructors.try stepTypeFix (Defaults.StepHooks Step)

in  tryStep
