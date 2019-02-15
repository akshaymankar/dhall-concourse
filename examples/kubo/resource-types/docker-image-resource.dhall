let Concourse =
	  ../lib/dhall-concourse/types.dhall

let Defaults =
	  ../lib/dhall-concourse/defaults.dhall

let Prelude =
	  ../lib/prelude/package.dhall

in    λ(name : Text)
	→ λ(repository : Text)
	→ λ(tag : Text)
	→   Concourse.ResourceType.Custom
		(   Defaults.CustomResourceType
		  ⫽ { name =
				name
			, type =
				"docker-image"
			, source =
				Some
				[ Prelude.JSON.keyText "repository" repository
				, Prelude.JSON.keyText "tag" tag
				]
			}
		)
	  : Concourse.ResourceType