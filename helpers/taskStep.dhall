let Types = ../types/package.dhall

let Defaults = ../defaults/package.dhall

let taskStep
    : Types.TaskStep → Types.Step
    = λ(taskStep : Types.TaskStep) →
        ./taskWithHooks.dhall taskStep (Defaults.StepHooks Types.Step)

in  taskStep
