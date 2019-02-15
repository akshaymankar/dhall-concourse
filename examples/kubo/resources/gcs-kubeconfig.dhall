let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
	  "gcs-kubeconfig"
	  "((gcs-json-key))"
	  "kubo-pipeline-store"
	  "k8s/config"
	: Concourse.Resource