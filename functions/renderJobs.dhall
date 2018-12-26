let Job = ./../types/Job.dhall

let Step = ./../types/Step.dhall

let BasicStep = ./../types/BasicStep.dhall

let GetStep = ./../types/GetStep.dhall

let PutStep = ./../types/PutStep.dhall

let TaskStep = ./../types/TaskStep.dhall

let Resource = ./../types/Resource.dhall

let RenderedGet =
	  { get :
		  Text
	  , resource :
		  Optional Text
	  , params :
		  Optional (List ./../types/TextTextPair.dhall)
	  , version :
		  Optional ./../types/GetVersion.dhall
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
		  Optional (List ./../types/TextTextPair.dhall)
	  , get_params :
		  Optional (List ./../types/TextTextPair.dhall)
	  }

let TaskConfig = ./../types/TaskConfig.dhall

let RenderedTask =
	  { task :
		  Text
	  , config :
		  Optional (List ./../types/TextTextPair.dhall)
	  , file :
		  Optional Text
	  , privileged :
		  Optional Bool
	  , params :
		  Optional (List ./../types/TextTextPair.dhall)
	  , image :
		  Optional Text
	  , input_mapping :
		  Optional (List ./../types/TextTextPair.dhall)
	  , output_mapping :
		  Optional (List ./../types/TextTextPair.dhall)
	  }

let RenderedBasic =
	  < Get : RenderedGet | Put : RenderedPut | Task : RenderedTask >

let stepName
	: Optional Text → Resource → Text
	=   λ(providedName : Optional Text)
	  → λ(resource : Resource)
	  → Optional/fold Text providedName Text (λ(t : Text) → t) resource.name

let resourceName
	: Optional Text → Resource → Optional Text
	=   λ(providedName : Optional Text)
	  → λ(resource : Resource)
	  → Optional/fold
		Text
		providedName
		(Optional Text)
		(λ(t : Text) → Some resource.name)
		(None Text)

let renderGet
	: GetStep → RenderedBasic
	=   λ(g : GetStep)
	  → RenderedBasic.Get
		(   g
		  ⫽ { get =
				stepName g.get g.resource
			, resource =
				resourceName g.get g.resource
			}
		)

let renderPut
	: PutStep → RenderedBasic
	=   λ(p : PutStep)
	  → RenderedBasic.Put
		(   p
		  ⫽ { put =
				stepName p.put p.resource
			, resource =
				resourceName p.put p.resource
			}
		)

let renderTaskConfig =
		λ(c : List ./../types/TextTextPair.dhall)
	  → { config = Some c, file = None Text }

let renderTaskFile =
		λ(f : Text)
	  → { config = None (List ./../types/TextTextPair.dhall), file = Some f }

let renderTask
	: TaskStep → RenderedBasic
	=   λ(t : TaskStep)
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
	: BasicStep → RenderedBasic
	=   λ(b : BasicStep)
	  → merge { Get = renderGet, Put = renderPut, Task = renderTask } b

let List/map = https://prelude.dhall-lang.org/List/map

let renderAggregate
	: List BasicStep → RenderedStep
	=   λ(bs : List BasicStep)
	  → RenderedStep.Aggregate
		{ aggregate =
			List/map BasicStep RenderedBasic renderBasicAsRenderedBasic bs
		}

let renderBasic
	: BasicStep → RenderedStep
	= λ(b : BasicStep) → RenderedStep.Basic (renderBasicAsRenderedBasic b)

let renderStep =
	  λ(s : Step) → merge { Basic = renderBasic, Aggregate = renderAggregate } s

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
		  Optional Step
	  , on_failure :
		  Optional Step
	  , on_abort :
		  Optional Step
	  , ensure :
		  Optional Step
	  }

let renderJob
	: Job → RenderedJob
	= λ(j : Job) → j ⫽ { plan = List/map Step RenderedStep renderStep j.plan }

let renderJobs =
	  λ(js : List Job) → { jobs = List/map Job RenderedJob renderJob js }

in  renderJobs