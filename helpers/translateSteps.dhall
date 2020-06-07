let Step = ../types/Step.dhall

let StepConstructors = ../types/StepConstructors.dhall

let Prelude = ../lib/prelude.dhall

let translateSteps
    : ∀(S : Type) → StepConstructors S → List Step → List S
    = λ(S : Type) →
      λ(c : StepConstructors S) →
        Prelude.List.map Step S (λ(s : Step) → s S c)

in  translateSteps
