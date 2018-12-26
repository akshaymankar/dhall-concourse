let ResourceType = ./../types/ResourceType.dhall

in    { name =
		  "CHANGEME"
	  , type =
		  ResourceType.InBuilt "CHANGEME"
	  , source =
		  None (List ./../types/TextTextPair.dhall)
	  , version =
		  None (List ./../types/TextTextPair.dhall)
	  , params =
		  None (List ./../types/TextTextPair.dhall)
	  , check_every =
		  None Text
	  , tags =
		  None (List Text)
	  , webhook_token =
		  None Text
	  }
	: ./../types/Resource.dhall