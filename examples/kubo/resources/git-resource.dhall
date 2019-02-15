let Concourse =
	  ../lib/dhall-concourse/types.dhall

let Defaults =
	  ../lib/dhall-concourse/defaults.dhall

let Prelude =
	  ../lib/prelude/package.dhall

in    λ(name : Text)
	→ λ(uri : Text)
	→ λ(branch : Text)
	→ λ(privateKey : Text)
	→     Defaults.Resource
		⫽ { name =
			  name
		  , type =
			  Concourse.ResourceType.InBuilt "git"
		  , source =
			  Some
			  [ Prelude.JSON.keyText "uri" uri
			  , Prelude.JSON.keyText "branch" branch
			  , Prelude.JSON.keyText "privateKey" privateKey
			  ]
		  }
	  : Concourse.Resource