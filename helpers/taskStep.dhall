let Types = ./../types/package.dhall

let taskStep
	: Types.TaskStep → Types.Step
	=   λ(taskStep : Types.TaskStep)
	  → λ(Step : Type)
	  → λ(GetStep : Types.GetStep → Step)
	  → λ(PutStep : Types.PutStep → Step)
	  → λ(TaskStep : Types.TaskStep → Step)
	  → λ(AggregateStep : List Step → Step)
	  → λ(DoStep : List Step → Step)
	  → λ(TryStep : Step → Step)
	  → λ(WithHooks : Step → Types.StepHooks Step → Step)
	  → TaskStep taskStep

in  taskStep