let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
	  "git-kubo-release"
	  "git@github.com:cloudfoundry-incubator/kubo-release"
	  "master"
	  "((git-ssh-key.private_key))"
	: Concourse.Resource