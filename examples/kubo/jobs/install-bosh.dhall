let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Helpers = ../lib/dhall-concourse/helpers.dhall

let Prelude = ../lib/prelude/package.dhall

let upstreamJobs = [ ./package-kubo-deployment-tarball.dhall ]

let passed = Some upstreamJobs

let getKuboDeployment = ../steps/get-kubo-deployment.dhall (None Bool) passed

let getKuboRelease = ../steps/get-kubo-release.dhall (None Bool) passed

let getKuboVersion =
	  Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/kubo-version.dhall
		  , passed =
			  Some (../utils/job-names.dhall upstreamJobs)
		  }
	  )

let getKuboReleaseTarballUntested =
	  Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/gcs-kubo-release-tarball-untested.dhall
		  , passed =
			  Some (../utils/job-names.dhall upstreamJobs)
		  }
	  )

let getKuboDeploymentTarballUntested =
	  Helpers.getStep
	  (   Defaults.GetStep
		⫽ { resource =
			  ../resources/gcs-kubo-deployment-tarball-untested.dhall
		  , passed =
			  Some (../utils/job-names.dhall upstreamJobs)
		  }
	  )

let getKuboLock =
		λ(env : Text)
	  → Helpers.getStep
		(   Defaults.GetStep
		  ⫽ { resource =
				../resources/kubo-lock.dhall env
			, passed =
				Some (../utils/job-names.dhall upstreamJobs)
			}
		)

in    λ(env : Text)
	→   Defaults.Job
	  ⫽ { name =
			"claim-lock-${env}"
		, plan =
			[ Helpers.aggregateStep
			  [ getKuboDeployment
			  , getKuboRelease
			  , getKuboVersion
			  , getKuboReleaseTarballUntested
			  , getKuboDeploymentTarballUntested
			  , getKuboLock env
			  ]
			]
		}