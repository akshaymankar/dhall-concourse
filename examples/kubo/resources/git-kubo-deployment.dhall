let Concourse = ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
        "git-kubo-deployment"
        "git@github.com:cloudfoundry-incubator/kubo-deployment"
        "master"
        "((git-ssh-key.private_key))"
    : Concourse.Resource
