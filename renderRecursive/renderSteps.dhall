  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types = ../types/package.dhall

  let renderStep = ./step.dhall JSON toJSON

  let List/map = https://prelude.dhall-lang.org/List/map

  let renderSteps
	  : List Types.Step → JSON
	  =   λ(steps : List Types.Step)
		→ toJSON (List JSON) (List/map Types.Step JSON renderStep steps)

  in  renderSteps