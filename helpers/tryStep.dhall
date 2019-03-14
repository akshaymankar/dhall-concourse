let Types = ./../types/package.dhall

let Defaults = ./../defaults/package.dhall

let tryStep
	: Types.Step → Types.Step
	=   λ(step : Types.Step)
	  → λ(Step : Type)
	  → λ(GetStep : Types.GetStep → Types.StepHooks Step → Step)
	  → λ(PutStep : Types.PutStep → Types.StepHooks Step → Step)
	  → λ(TaskStep : Types.TaskStep → Types.StepHooks Step → Step)
	  → λ(AggregateStep : List Step → Types.StepHooks Step → Step)
	  → λ(DoStep : List Step → Types.StepHooks Step → Step)
	  → λ(TryStep : Step → Types.StepHooks Step → Step)
	  → let stepTypeFix =
			  step Step GetStep PutStep TaskStep AggregateStep DoStep TryStep

		in  TryStep stepTypeFix (Defaults.StepHooks Step)

in  tryStep