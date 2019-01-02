let Types = ./../types/package.dhall

in    λ(taskStep : Types.TaskStep)
	→ Types.Step.Basic (Types.BasicStep.Task taskStep)