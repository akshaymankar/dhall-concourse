let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let typeFixSteps
    : ∀(T : Type) → Types.StepConstructors T → List Types.Step → List T
    =   λ(T : Type)
      → λ(constructors : Types.StepConstructors T)
      → Prelude.List.map Types.Step T (λ(s : Types.Step) → s T constructors)

let typeFix
    :   ∀(T : Type)
      → Types.StepConstructors T
      → Types.InParallelStep Types.Step
      → Types.InParallelStep T
    =   λ(T : Type)
      → λ(constructors : Types.StepConstructors T)
      → λ(parallel : Types.InParallelStep Types.Step)
      → merge
          { Steps =
                λ(s : List Types.Step)
              → (Types.InParallelStep T).Steps (typeFixSteps T constructors s)
          , Config =
                λ(cfg : Types.InParallelConfig Types.Step)
              → (Types.InParallelStep T).Config
                  (cfg ⫽ { steps = typeFixSteps T constructors cfg.steps })
          }
          parallel

let inParallelWithHooks
    : Types.InParallelStep Types.Step → Types.StepHooks Types.Step → Types.Step
    =   λ(parallelSteps : Types.InParallelStep Types.Step)
      → λ(hooks : Types.StepHooks Types.Step)
      → λ(Step : Type)
      → λ(constructors : Types.StepConstructors Step)
      → let stepTypeFix = typeFix Step constructors parallelSteps

        in  constructors.in_parallel
              stepTypeFix
              (./translateHooks.dhall hooks Step constructors)

in  inParallelWithHooks
