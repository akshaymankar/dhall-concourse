let Concourse = ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
        "gcs-bosh-creds"
        "((gcs-json-key))"
        "kubo-pipeline-store"
        "bosh/creds.yml"
    : Concourse.Resource
