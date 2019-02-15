let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./docker-image-resource.dhall
	  "slack-notification"
	  "cfcommunity/slack-notification-resource"
	  "latest"
	: Concourse.ResourceType