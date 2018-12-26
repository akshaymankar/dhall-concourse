let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let RenderTypes = ./types.dhall

let stepName
	: Optional Text → Types.Resource → Text
	=   λ(providedName : Optional Text)
	  → λ(resource : Types.Resource)
	  → Optional/fold Text providedName Text (λ(t : Text) → t) resource.name

let resourceName
	: Optional Text → Types.Resource → Optional Text
	=   λ(providedName : Optional Text)
	  → λ(resource : Types.Resource)
	  → Optional/fold
		Text
		providedName
		(Optional Text)
		(λ(t : Text) → Some resource.name)
		(None Text)

let renderGet
	: Types.GetStep → RenderTypes.BasicStep
	=   λ(g : Types.GetStep)
	  → RenderTypes.BasicStep.Get
		(   g
		  ⫽ { get =
				stepName g.get g.resource
			, resource =
				resourceName g.get g.resource
			}
		)

let renderPut
	: Types.PutStep → RenderTypes.BasicStep
	=   λ(p : Types.PutStep)
	  → RenderTypes.BasicStep.Put
		(   p
		  ⫽ { put =
				stepName p.put p.resource
			, resource =
				resourceName p.put p.resource
			}
		)

let renderTaskConfig =
	  λ(c : List Types.TextTextPair) → { config = Some c, file = None Text }

let renderTaskFile =
	  λ(f : Text) → { config = None (List Types.TextTextPair), file = Some f }

let renderTask
	: Types.TaskStep → RenderTypes.BasicStep
	=   λ(t : Types.TaskStep)
	  → RenderTypes.BasicStep.Task
		(   t
		  ⫽ ( merge
			  { Config = renderTaskConfig, File = renderTaskFile }
			  t.config
			)
		)

let renderBasicAsRenderedBasic
	: Types.BasicStep → RenderTypes.BasicStep
	=   λ(b : Types.BasicStep)
	  → merge { Get = renderGet, Put = renderPut, Task = renderTask } b

let renderAggregate
	: List Types.BasicStep → RenderTypes.Step
	=   λ(bs : List Types.BasicStep)
	  → RenderTypes.Step.Aggregate
		{ aggregate =
			Prelude.`List`.map
			Types.BasicStep
			RenderTypes.BasicStep
			renderBasicAsRenderedBasic
			bs
		}

let renderBasic
	: Types.BasicStep → RenderTypes.Step
	=   λ(b : Types.BasicStep)
	  → RenderTypes.Step.Basic (renderBasicAsRenderedBasic b)

let renderStep =
		λ(s : Types.Step)
	  → merge { Basic = renderBasic, Aggregate = renderAggregate } s

in  renderStep