-- let BasicStep = ./BasicStep.dhall

-- let Step = < Basic : BasicStep | Aggregate : List BasicStep >

-- in  Step

let StepHooks = ./StepHooks.dhall

let Step =
		∀(Step : Type)
	  → ∀(GetStep : ./GetStep.dhall → StepHooks Step → Step)
	  → ∀(PutStep : ./PutStep.dhall → StepHooks Step → Step)
	  → ∀(TaskStep : ./TaskStep.dhall → StepHooks Step → Step)
	  → ∀(AggregateStep : List Step → StepHooks Step → Step)
	  → ∀(DoStep : List Step → StepHooks Step → Step)
	  → ∀(TryStep : Step → StepHooks Step → Step)
	  → Step

in  Step