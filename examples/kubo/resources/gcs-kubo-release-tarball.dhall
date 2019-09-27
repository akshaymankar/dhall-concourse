let Concourse = ../lib/dhall-concourse/types.dhall

in    ./gcs-regexp-resource.dhall
        "gcs-kubo-release-tarball"
        "((gcs-json-key))"
        "kubo-public"
        "dev-builds/kubo-release-latest.tgz"
    : Concourse.Resource
