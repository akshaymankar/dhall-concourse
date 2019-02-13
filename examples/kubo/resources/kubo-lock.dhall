let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

in    λ(env : Text)
	→     Defaults.Resource
		⫽ { name =
			  "kubo-lock-${env}"
		  , type =
			  Concourse.ResourceType.InBuilt "pool"
		  , source =
			  Some
			  [ Prelude.JSON.keyText
				"source"
				"git@github.com:pivotal-cf-experimental/kubo-locks.git"
			  , Prelude.JSON.keyText "branch" "master"
			  , Prelude.JSON.keyText "private_key" "((git-ssh-key.private_key))"
			  , Prelude.JSON.keyText "pool" "kubo-${env}"
			  ]
		  }
	  : Concourse.Resource