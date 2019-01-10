  λ(JSON : Type)
→ λ(toJSON : ∀(T : Type) → ∀(t : T) → JSON)
→ { job = ./job.dhall, step = ./step.dhall, steps = ./steps.dhall }