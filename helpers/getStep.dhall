let Types = ./../types/package.dhall

let Defaults = ../defaults/package.dhall

in    (   λ(getStep : Types.GetStep)
		→ λ(Step : Type)
		→ λ(GetStep : Types.GetStep → Types.StepHooks Step → Step)
		→ λ(PutStep : Types.PutStep → Types.StepHooks Step → Step)
		→ λ(TaskStep : Types.TaskStep → Types.StepHooks Step → Step)
		→ λ(AggregateStep : List Step → Types.StepHooks Step → Step)
		→ λ(DoStep : List Step → Types.StepHooks Step → Step)
		→ λ(TryStep : Step → Types.StepHooks Step → Step)
		→ GetStep getStep (Defaults.StepHooks Step)
	  )
	: Types.GetStep → Types.Step