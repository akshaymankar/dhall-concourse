let Types = ./../types/package.dhall

let Defaults = ./../defaults/package.dhall

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let aggregateStep
	: List Types.Step → Types.Step
	=   λ(aggregatedSteps : List Types.Step)
	  → λ(Step : Type)
	  → λ(GetStep : Types.GetStep → Types.StepHooks Step → Step)
	  → λ(PutStep : Types.PutStep → Types.StepHooks Step → Step)
	  → λ(TaskStep : Types.TaskStep → Types.StepHooks Step → Step)
	  → λ(AggregateStep : List Step → Types.StepHooks Step → Step)
	  → λ(DoStep : List Step → Types.StepHooks Step → Step)
	  → λ(TryStep : Step → Types.StepHooks Step → Step)
	  → let stepTypeFix =
			  Prelude.`List`.map
			  Types.Step
			  Step
			  (   λ(s : Types.Step)
				→ s Step GetStep PutStep TaskStep AggregateStep DoStep TryStep
			  )
			  aggregatedSteps

		in  AggregateStep stepTypeFix (Defaults.StepHooks Step)

in  aggregateStep