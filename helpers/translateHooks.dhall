let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let translateHooks
    : ∀(S : Type) →
      Types.StepConstructors S →
      Types.StepHooks Types.Step →
        Types.StepHooks S
    = λ(S : Type) →
      λ(constructors : Types.StepConstructors S) →
      λ(hooks : Types.StepHooks Types.Step) →
        let translateOptionalStep =
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
