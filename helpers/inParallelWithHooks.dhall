let Types = ../types/package.dhall

let inParallelWithHooks
    : Types.InParallelStep Types.Step → Types.StepHooks Types.Step → Types.Step
    = λ(parallelSteps : Types.InParallelStep Types.Step) →
      λ(hooks : Types.StepHooks Types.Step) →
      λ(Step : Type) →
      λ(constructors : Types.StepConstructors Step) →
        constructors.in_parallel
          (./translateInParallelStep.dhall Step constructors parallelSteps)
          (./translateHooks.dhall Step constructors hooks)

in  inParallelWithHooks
