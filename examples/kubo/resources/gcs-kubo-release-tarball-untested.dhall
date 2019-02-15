let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
	  "gcs-kubo-release-tarball-untested"
	  "((gcs-json-key))"
	  "kubo-pipeline-store"
	  "dev-builds/kubo-release-(.*).tgz"
	: Concourse.Resource