let StepHooks = ./StepHooks.dhall

in    λ(Step : Type)
    → { get : ./GetStep.dhall → StepHooks Step → Step
      , put : ./PutStep.dhall → StepHooks Step → Step
      , task : ./TaskStep.dhall → StepHooks Step → Step
      , aggregate : List Step → StepHooks Step → Step
      , in_parallel : ./InParallelStep.dhall Step → StepHooks Step → Step
      , do : List Step → StepHooks Step → Step
      , try : Step → StepHooks Step → Step
      }
