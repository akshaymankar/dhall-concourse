let Concourse = ../lib/dhall-concourse/types.dhall

in    ./bosh-deployment.dhall "tinyproxy-deployment" "tinyproxy"
    : Concourse.Resource
