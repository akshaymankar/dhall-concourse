let Concourse = ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
        "gcs-load-balancer-vars"
        "((gcs-json-key))"
        "kubo-pipeline-store"
        "load-balancer-vars.yml"
    : Concourse.Resource
