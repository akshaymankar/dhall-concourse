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

let RenderedAggregate = { aggregate : List RenderedBasic }

let RenderedStep = < Basic : RenderedBasic | Aggregate : RenderedAggregate >

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
		  Optional RenderedStep
	  , on_failure :
		  Optional RenderedStep
	  , on_abort :
		  Optional RenderedStep
	  , ensure :
		  Optional RenderedStep
	  }

in  { GetStep =
		RenderedGet
	, PutStep =
		RenderedPut
	, TaskStep =
		RenderedTask
	, BasicStep =
		RenderedBasic
	, AggregateStep =
		RenderedAggregate
	, Step =
		RenderedStep
	, Job =
		RenderedJob
	}