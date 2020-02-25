let Types = ../types/package.dhall

let doStep
    : List Types.Step → Types.StepHooks Types.Step → Types.Step
    =   λ(steps : List Types.Step)
      → λ(hooks : Types.StepHooks Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → constructors.do
          (./translateSteps.dhall Step constructors steps)
          (./translateHooks.dhall Step constructors hooks)

in  doStep
