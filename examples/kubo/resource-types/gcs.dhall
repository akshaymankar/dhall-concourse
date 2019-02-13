let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

in    ./docker-image-resource.dhall
	  "gcs"
	  "cfcommunity/slack-notification-resource"
	  "latest"
	: Concourse.ResourceType