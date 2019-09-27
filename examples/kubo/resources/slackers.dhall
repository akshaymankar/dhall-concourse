let Concourse = ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
        "slackers"
        "git@github.com:cloudfoundry-incubator/cfcr-home"
        "master"
        "((git-ssh-key.private_key))"
    : Concourse.Resource
