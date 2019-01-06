-- let BasicStep = ./BasicStep.dhall

-- let Step = < Basic : BasicStep | Aggregate : List BasicStep >

-- in  Step

let StepHooks = ./StepHooks.dhall

let Step =
		∀(Step : Type)
	  → ∀(GetStep : ./GetStep.dhall → Step)
	  → ∀(PutStep : ./PutStep.dhall → Step)
	  → ∀(TaskStep : ./TaskStep.dhall → Step)
	  → ∀(AggregateStep : List Step → Step)
	  → ∀(DoStep : List Step → Step)
	  → ∀(TryStep : Step → Step)
	  → ∀(WithHooks : Step → StepHooks Step → Step)
	  → Step

in  Step