let render = ./lib/dhall-concourse/render.dhall JSON toJSON

let resourceTypes =
	  [ ./resource-types/bosh-deployment.dhall
	  , ./resource-types/bosh-errand.dhall
	  , ./resource-types/gcs.dhall
	  , ./resource-types/slack-notification.dhall
	  ]

let resources =
	  [ ./resources/bbr-cli.dhall
	  , ./resources/cfcr-deployment.dhall
	  , ./resources/compilation-deployment.dhall
	  , ./resources/gaffer-source-json.dhall
	  , ./resources/gcs-bosh-creds.dhall
	  , ./resources/gcs-bosh-state.dhall
	  , ./resources/gcs-kubeconfig.dhall
	  , ./resources/gcs-kubo-deployment-tarball-untested.dhall
	  , ./resources/gcs-kubo-deployment-tarball.dhall
	  , ./resources/gcs-kubo-deployments.dhall
	  , ./resources/gcs-kubo-release-tarball-untested.dhall
	  , ./resources/gcs-kubo-release-tarball.dhall
	  , ./resources/gcs-kubo-releases.dhall
	  , ./resources/gcs-load-balancer-vars.dhall
	  , ./resources/git-bosh-deployment.dhall
	  , ./resources/git-kubo-ci.dhall
	  , ./resources/git-kubo-deployment.dhall
	  , ./resources/git-kubo-drats.dhall
	  , ./resources/git-kubo-release.dhall
	  , ./resources/github-etcd-release.dhall
	  , ./resources/kubo-lock.dhall "aws"
	  , ./resources/kubo-lock.dhall "gcp"
	  , ./resources/kubo-lock.dhall "vsphere"
	  , ./resources/kubo-lock.dhall "azure"
	  , ./resources/kubo-version.dhall
	  , ./resources/old-kubo-deployment-tarball.dhall
	  , ./resources/old-kubo-release-tarball.dhall
	  , ./resources/run-apply-addons-errand.dhall
	  , ./resources/run-smoke-tests-errand.dhall
	  , ./resources/slack-alert.dhall
	  , ./resources/slackers.dhall
	  , ./resources/source-json.dhall
	  , ./resources/tinyproxy-deployment.dhall
	  ]

let jobs =
	  [ ./jobs/run-unit-tests.dhall
	  , ./jobs/build-kubo-release.dhall
	  , ./jobs/package-kubo-deployment-tarball.dhall
	  ]

in    render.resourceTypes resourceTypes
	⫽ render.resources resources
	⫽ render.jobs jobs