  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types = ../types/package.dhall

  let renderGet
	  : Types.GetStep → Types.StepHooks JSON → JSON
	  =   λ(g : Types.GetStep)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON (Types.GetStep ⩓ Types.StepHooks JSON) (g ⫽ h)

  let renderPut
	  : Types.PutStep → Types.StepHooks JSON → JSON
	  =   λ(p : Types.PutStep)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON (Types.PutStep ⩓ Types.StepHooks JSON) (p ⫽ h)

  let renderTask
	  : Types.TaskStep → Types.StepHooks JSON → JSON
	  =   λ(t : Types.TaskStep)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON (Types.TaskStep ⩓ Types.StepHooks JSON) (t ⫽ h)

  let renderAggregate
	  : List JSON → Types.StepHooks JSON → JSON
	  =   λ(steps : List JSON)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON
		  ({ aggregate : List JSON } ⩓ Types.StepHooks JSON)
		  ({ aggregate = steps } ⫽ h)

  let renderDo
	  : List JSON → Types.StepHooks JSON → JSON
	  =   λ(steps : List JSON)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON
		  ({ do : List JSON } ⩓ Types.StepHooks JSON)
		  ({ do = steps } ⫽ h)

  let renderTry
	  : JSON → Types.StepHooks JSON → JSON
	  =   λ(step : JSON)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON ({ try : JSON } ⩓ Types.StepHooks JSON) ({ try = step } ⫽ h)

  let renderStep
	  : Types.Step → JSON
	  =   λ(step : Types.Step)
		→ step
		  JSON
		  renderGet
		  renderPut
		  renderTask
		  renderAggregate
		  renderDo
		  renderTry

  in  renderStep