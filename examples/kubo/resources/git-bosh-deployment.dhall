let Concourse = ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
        "git-bosh-deployment"
        "git@github.com:cloudfoundry/bosh-deployment"
        "master"
        "((git-ssh-key.private_key))"
    : Concourse.Resource
