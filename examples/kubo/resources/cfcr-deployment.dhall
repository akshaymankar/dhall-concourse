let Concourse =
	  ../lib/dhall-concourse/types.dhall

in  ./bosh-deployment.dhall "cfcr-deployment" "ci-service" : Concourse.Resource