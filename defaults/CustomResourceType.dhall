let Types = ./../types/package.dhall

in    { name =
		  "CHANGEME"
	  , type =
		  "CHANGEME"
	  , source =
		  [] : Optional (List Types.TextTextPair)
	  }
	: Types.CustomResourceType