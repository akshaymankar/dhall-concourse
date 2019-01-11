  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types =
		../types/package.dhall

  let renderStep = ./step.dhall JSON toJSON

  let RenderedTypes = ./types.dhall JSON

  let Prelude =
		https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

  let renderOptionalStep
	  : Optional Types.Step → Optional JSON
	  = Prelude.`Optional`.map Types.Step JSON renderStep

  let renderJob
	  : Types.Job → RenderedTypes.Job
	  =   λ(j : Types.Job)
		→   j
		  ⫽ { plan =
				Prelude.`List`.map Types.Step JSON renderStep j.plan
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