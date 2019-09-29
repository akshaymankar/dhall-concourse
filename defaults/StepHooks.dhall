  λ(Step : Type)
→ let Types = ../types/package.dhall
  in    { on_success = None Step
        , on_failure = None Step
        , on_abort = None Step
        , ensure = None Step
        }
      : Types.StepHooks Step
