let Types = ./../types/package.dhall

let Defaults = ./../defaults/package.dhall

let Prelude = ../lib/prelude.dhall

let doStep
	: List Types.Step → Types.Step
	=   λ(steps : List Types.Step)
	  → λ(Step : Type)
	  → λ(GetStep : Types.GetStep → Types.StepHooks Step → Step)
	  → λ(PutStep : Types.PutStep → Types.StepHooks Step → Step)
	  → λ(TaskStep : Types.TaskStep → Types.StepHooks Step → Step)
	  → λ(AggregateStep : List Step → Types.StepHooks Step → Step)
	  → λ(DoStep : List Step → Types.StepHooks Step → Step)
	  → λ(TryStep : Step → Types.StepHooks Step → Step)
	  → let stepTypeFix =
			  Prelude.List.map
			  Types.Step
			  Step
			  (   λ(s : Types.Step)
				→ s Step GetStep PutStep TaskStep AggregateStep DoStep TryStep
			  )
			  steps

		in  DoStep stepTypeFix (Defaults.StepHooks Step)

in  doStep
