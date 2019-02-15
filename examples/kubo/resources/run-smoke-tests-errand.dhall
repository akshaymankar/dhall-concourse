let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./bosh-errand.dhall "run-apply-addons-errand" "ci-service"
	: Concourse.Resource