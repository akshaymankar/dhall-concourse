let Types = ../types/package.dhall

let tryStep
    : Types.Step → Types.StepHooks Types.Step → Types.Step
    =   λ(step : Types.Step)
      → λ(hooks : Types.StepHooks Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix = step Step constructors

        in  constructors.try
              stepTypeFix
              (./translateHooks.dhall hooks Step constructors)

in  tryStep
