let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let taskStep
    : Types.TaskStep → Types.Step
    =   λ(taskStep : Types.TaskStep)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → constructors.task taskStep (Defaults.StepHooks Step)

in  taskStep
