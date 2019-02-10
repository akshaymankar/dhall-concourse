  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types =
		./../types/package.dhall

  let Prelude =
		https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

  let RenderedTypes =
		{ Job =
			{ name :
				Text
			, plan :
				List JSON
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
				Optional JSON
			, on_failure :
				Optional JSON
			, on_abort :
				Optional JSON
			, ensure :
				Optional JSON
			}
		}

  let renderJob = ./job.dhall JSON toJSON

  let renderJobs =
		  λ(js : List Types.Job)
		→ { jobs = Prelude.`List`.map Types.Job RenderedTypes.Job renderJob js }

  in  renderJobs