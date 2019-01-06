let Types = ./../types/package.dhall

let putStep
	: Types.PutStep → Types.Step
	=   λ(putStep : Types.PutStep)
	  → λ(Step : Type)
	  → λ(GetStep : Types.GetStep → Step)
	  → λ(PutStep : Types.PutStep → Step)
	  → λ(TaskStep : Types.TaskStep → Step)
	  → λ(AggregateStep : List Step → Step)
	  → λ(DoStep : List Step → Step)
	  → λ(TryStep : Step → Step)
	  → λ(WithHooks : Step → Types.StepHooks Step → Step)
	  → PutStep putStep

in  putStep