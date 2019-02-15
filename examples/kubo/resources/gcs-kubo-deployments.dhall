let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
	  "gcs-kubo-deployments"
	  "((gcs-json-key))"
	  "kubo-releases"
	  "kubo-deployment-(.*).tgz"
	: Concourse.Resource