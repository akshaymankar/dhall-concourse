let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./docker-image-resource.dhall
	  "gcs"
	  "cfcommunity/slack-notification-resource"
	  "latest"
	: Concourse.ResourceType