let Types = ./../types/package.dhall

in    { type =
		  "CHANGEME"
	  , source =
		  [] : List Types.TextTextPair
	  , params =
		  None (List Types.TextTextPair)
	  , version =
		  None (List Types.TextTextPair)
	  }
	: Types.ImageResource