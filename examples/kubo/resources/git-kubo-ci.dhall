let Concourse = ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
        "git-kubo-ci"
        "git@github.com:cloudfoundry-incubator/kubo-ci"
        "master"
        "((git-ssh-key.private_key))"
    : Concourse.Resource
