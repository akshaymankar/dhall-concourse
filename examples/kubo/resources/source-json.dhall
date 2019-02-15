let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
	  "source-json"
	  "((gcs-json-key))"
	  "kubo-pipeline-store"
	  "source.json"
	: Concourse.Resource