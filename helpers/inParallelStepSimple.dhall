let Types = ../types/package.dhall

let inParallelStep
    : List Types.Step → Types.Step
    = λ(parallelSteps : List Types.Step) →
        ./inParallelStep.dhall
          ((Types.InParallelStep Types.Step).Steps parallelSteps)

in  inParallelStep
