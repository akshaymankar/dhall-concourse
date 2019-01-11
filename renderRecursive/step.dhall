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

  let RenderedTask =
		{ task :
			Text
		, config :
			Optional Types.TaskConfig
		, file :
			Optional Text
		, privileged :
			Optional Bool
		, params :
			Optional (List Types.TextTextPair)
		, image :
			Optional Text
		, input_mapping :
			Optional (List Types.TextTextPair)
		, output_mapping :
			Optional (List Types.TextTextPair)
		}

  let renderTaskConfig =
		λ(c : Types.TaskConfig) → { config = Some c, file = None Text }

  let renderTaskFile =
		λ(f : Text) → { config = None Types.TaskConfig, file = Some f }

  let renderTask
	  : Types.TaskStep → Types.StepHooks JSON → JSON
	  =   λ(t : Types.TaskStep)
		→ λ(h : Types.StepHooks JSON)
		→ toJSON
		  (RenderedTask ⩓ Types.StepHooks JSON)
		  (   t
			⫽ ( merge
				{ Config = renderTaskConfig, File = renderTaskFile }
				t.config
			  )
			⫽ h
		  )

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