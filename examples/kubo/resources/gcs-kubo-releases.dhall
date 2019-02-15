let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
	  "gcs-kubo-releases"
	  "((gcs-json-key))"
	  "kubo-releases"
	  "kubo-release-(.*).tgz"
	: Concourse.Resource