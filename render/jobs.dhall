let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let RenderTypes = ./types.dhall

let renderStep = ./step.dhall

let renderOptionalStep =
	  Prelude.`Optional`.map Types.Step RenderTypes.Step renderStep

let renderJob
	: Types.Job → RenderTypes.Job
	=   λ(j : Types.Job)
	  →   j
		⫽ { plan =
			  Prelude.`List`.map Types.Step RenderTypes.Step renderStep j.plan
		  , on_success =
			  renderOptionalStep j.on_success
		  , on_failure =
			  renderOptionalStep j.on_failure
		  , on_abort =
			  renderOptionalStep j.on_abort
		  , ensure =
			  renderOptionalStep j.ensure
		  }

let renderJobs =
		λ(js : List Types.Job)
	  → { jobs = Prelude.`List`.map Types.Job RenderTypes.Job renderJob js }

in  renderJobs