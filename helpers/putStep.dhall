let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let putStep
    : Types.PutStep → Types.Step
    =   λ(putStep : Types.PutStep)
      → λ(Step : Type)
      → λ(GetStep : Types.GetStep → Types.StepHooks Step → Step)
      → λ(PutStep : Types.PutStep → Types.StepHooks Step → Step)
      → λ(TaskStep : Types.TaskStep → Types.StepHooks Step → Step)
      → λ(AggregateStep : List Step → Types.StepHooks Step → Step)
      → λ(DoStep : List Step → Types.StepHooks Step → Step)
      → λ(TryStep : Step → Types.StepHooks Step → Step)
      → PutStep putStep (Defaults.StepHooks Step)

in  putStep
