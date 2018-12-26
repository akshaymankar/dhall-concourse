let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let RenderedGet =
	  { get :
		  Text
	  , resource :
		  Optional Text
	  , params :
		  Optional (List Types.TextTextPair)
	  , version :
		  Optional Types.GetVersion
	  , passed :
		  Optional (List Text)
	  , trigger :
		  Optional Bool
	  }

let RenderedPut =
	  { put :
		  Text
	  , resource :
		  Optional Text
	  , params :
		  Optional (List Types.TextTextPair)
	  , get_params :
		  Optional (List Types.TextTextPair)
	  }

let TaskConfig = Types.TaskConfig

let RenderedTask =
	  { task :
		  Text
	  , config :
		  Optional (List Types.TextTextPair)
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

let RenderedBasic =
	  < Get : RenderedGet | Put : RenderedPut | Task : RenderedTask >

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
	: Types.GetStep → RenderedBasic
	=   λ(g : Types.GetStep)
	  → RenderedBasic.Get
		(   g
		  ⫽ { get =
				stepName g.get g.resource
			, resource =
				resourceName g.get g.resource
			}
		)

let renderPut
	: Types.PutStep → RenderedBasic
	=   λ(p : Types.PutStep)
	  → RenderedBasic.Put
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
	: Types.TaskStep → RenderedBasic
	=   λ(t : Types.TaskStep)
	  → RenderedBasic.Task
		(   t
		  ⫽ ( merge
			  { Config = renderTaskConfig, File = renderTaskFile }
			  t.config
			)
		)

let RenderedAggregate = { aggregate : List RenderedBasic }

let RenderedStep = < Basic : RenderedBasic | Aggregate : RenderedAggregate >

let renderBasicAsRenderedBasic
	: Types.BasicStep → RenderedBasic
	=   λ(b : Types.BasicStep)
	  → merge { Get = renderGet, Put = renderPut, Task = renderTask } b

let renderAggregate
	: List Types.BasicStep → RenderedStep
	=   λ(bs : List Types.BasicStep)
	  → RenderedStep.Aggregate
		{ aggregate =
			Prelude.`List`.map
			Types.BasicStep
			RenderedBasic
			renderBasicAsRenderedBasic
			bs
		}

let renderBasic
	: Types.BasicStep → RenderedStep
	= λ(b : Types.BasicStep) → RenderedStep.Basic (renderBasicAsRenderedBasic b)

let renderStep =
		λ(s : Types.Step)
	  → merge { Basic = renderBasic, Aggregate = renderAggregate } s

let RenderedJob =
	  { name :
		  Text
	  , plan :
		  List RenderedStep
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
		  Optional Types.Step
	  , on_failure :
		  Optional Types.Step
	  , on_abort :
		  Optional Types.Step
	  , ensure :
		  Optional Types.Step
	  }

let renderJob
	: Types.Job → RenderedJob
	=   λ(j : Types.Job)
	  →   j
		⫽ { plan =
			  Prelude.`List`.map Types.Step RenderedStep renderStep j.plan
		  }

let renderJobs =
		λ(js : List Types.Job)
	  → { jobs = Prelude.`List`.map Types.Job RenderedJob renderJob js }

in  renderJobs