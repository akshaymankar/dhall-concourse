let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Helpers = ../lib/dhall-concourse/helpers.dhall

let Prelude = ../lib/prelude/package.dhall

in    λ(trigger : Optional Bool)
	→ λ(passed : Optional (List Concourse.Job))
	→ Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/git-kubo-deployment.dhall
		  , trigger =
			  trigger
		  , passed =
			  Prelude.`Optional`.map
			  (List Concourse.Job)
			  (List Text)
			  ../utils/job-names.dhall
			  passed
		  }
	  )
