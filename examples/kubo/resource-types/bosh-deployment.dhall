let Concourse = ../lib/dhall-concourse/types.dhall

in    ./docker-image-resource.dhall
        "bosh-deployment"
        "cloudfoundry/bosh-deployment-resource"
        "latest"
    : Concourse.ResourceType
