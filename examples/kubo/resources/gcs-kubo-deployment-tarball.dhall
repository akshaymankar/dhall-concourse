let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
	  "gcs-kubo-deployment-tarball"
	  "((gcs-json-key))"
	  "kubo-public"
	  "kubo-deployment-latest.tgz"
	: Concourse.Resource