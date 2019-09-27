let Concourse = ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
        "gcs-bosh-state"
        "((gcs-json-key))"
        "kubo-pipeline-store"
        "bosh/state.json"
    : Concourse.Resource
