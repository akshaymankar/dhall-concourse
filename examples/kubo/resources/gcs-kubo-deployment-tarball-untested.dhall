let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
	  "gcs-kubo-deployment-tarball-untested"
	  "((gcs-json-key))"
	  "kubo-pipeline-store"
	  "dev-builds/kubo-deployment-(.*).tgz"
	: Concourse.Resource