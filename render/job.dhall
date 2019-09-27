  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types = ../types/package.dhall
  
  let renderStep = ./step.dhall JSON toJSON
  
  let RenderedTypes =
        { Job =
            { name :
                Text
            , plan :
                List JSON
            , serial :
                Optional Bool
            , build_logs_to_retain :
                Optional Natural
            , serial_groups :
                Optional (List Text)
            , max_in_flight :
                Optional Natural
            , public :
                Optional Bool
            , disable_manual_trigger :
                Optional Bool
            , interruptible :
                Optional Bool
            , on_success :
                Optional JSON
            , on_failure :
                Optional JSON
            , on_abort :
                Optional JSON
            , ensure :
                Optional JSON
            }
        }
  
  let Prelude = ../lib/prelude.dhall
  
  let renderOptionalStep
      : Optional Types.Step → Optional JSON
      = Prelude.Optional.map Types.Step JSON renderStep
  
  let renderJob
      : Types.Job → RenderedTypes.Job
      =   λ(j : Types.Job)
        →   j
          ⫽ { plan =
                Prelude.List.map Types.Step JSON renderStep j.plan
            , on_success =
                renderOptionalStep j.on_success
            , on_failure =
                renderOptionalStep j.on_failure
            , on_abort =
                renderOptionalStep j.on_abort
            , ensure =
                renderOptionalStep j.ensure
            }
  
  in  renderJob
