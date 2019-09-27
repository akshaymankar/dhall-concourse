let StepHooks =
        λ(Step : Type)
      → { on_success :
            Optional Step
        , on_failure :
            Optional Step
        , on_abort :
            Optional Step
        , ensure :
            Optional Step
        }

in  StepHooks
