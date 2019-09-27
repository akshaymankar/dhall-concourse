let Concourse = ../lib/dhall-concourse/types.dhall

in    ./bosh-deployment.dhall "compilation-deployment" "compilation"
    : Concourse.Resource
