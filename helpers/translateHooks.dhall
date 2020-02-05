let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let translateHooks
    :   Types.StepHooks Types.Step
      → ∀(S : Type)
      → Types.StepConstructors S
      → Types.StepHooks S
    =   λ(hooks : Types.StepHooks Types.Step)
      → λ(S : Type)
      → λ(constructors : Types.StepConstructors S)
      → let translateOptionalStep =
              Prelude.Optional.map
                Types.Step
                S
                (λ(s : Types.Step) → s S constructors)

        in  { on_failure = translateOptionalStep hooks.on_failure
            , on_success = translateOptionalStep hooks.on_success
            , on_abort = translateOptionalStep hooks.on_abort
            , ensure = translateOptionalStep hooks.ensure
            }

in  translateHooks
