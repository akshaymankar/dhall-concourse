let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./docker-image-resource.dhall
	  "bosh-errand"
	  "pcfkubo/bosh2-errand-resource"
	  "v0.1.3-dev"
	: Concourse.ResourceType