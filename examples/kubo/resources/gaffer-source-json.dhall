let Concourse = ../lib/dhall-concourse/types.dhall

in    ./gcs-resource.dhall
        "gaffer-source-json"
        "((gcs-json-key))"
        "kubo-pipeline-store"
        "gaffer-env/source.json"
    : Concourse.Resource
