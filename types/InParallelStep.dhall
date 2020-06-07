λ(Step : Type) →
  let InParallelConfig = ./InParallelConfig.dhall Step

  in  < Steps : List Step | Config : InParallelConfig >
