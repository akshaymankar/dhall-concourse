let Concourse = ../lib/dhall-concourse/types.dhall

in    ./docker-image-resource.dhall "gcs" "frodenas/gcs-resource" "latest"
	: Concourse.ResourceType