let Types = ../types/package.dhall

let translateInParallelStep
    : ∀(T : Type) →
      Types.StepConstructors T →
      Types.InParallelStep Types.Step →
        Types.InParallelStep T
    = λ(T : Type) →
      λ(constructors : Types.StepConstructors T) →
      λ(parallel : Types.InParallelStep Types.Step) →
        merge
          { Steps =
              λ(s : List Types.Step) →
                (Types.InParallelStep T).Steps
                  (./translateSteps.dhall T constructors s)
          , Config =
              λ(cfg : Types.InParallelConfig Types.Step) →
                (Types.InParallelStep T).Config
                  (   cfg
                    ⫽ { steps = ./translateSteps.dhall T constructors cfg.steps
                      }
                  )
          }
          parallel

in  translateInParallelStep
