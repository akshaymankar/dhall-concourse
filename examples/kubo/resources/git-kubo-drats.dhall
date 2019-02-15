let Concourse =
	  ../lib/dhall-concourse/types.dhall

in    ./git-resource.dhall
	  "git-kubo-drats"
	  "git@github.com:cloudfoundry-incubator/kubo-disaster-recovery-acceptance-tests.git"
	  "master"
	  "((git-ssh-key.private_key))"
	: Concourse.Resource