let Types = ./../types/package.dhall

in    { task =
		  "CHANGEME"
	  , config =
		  ./TaskConfig.dhall
	  , privileged =
		  None Bool
	  , params =
		  None (List Types.TextTextPair)
	  , image =
		  None Text
	  , input_mapping =
		  None (List Types.TextTextPair)
	  , output_mapping =
		  None (List Types.TextTextPair)
	  }
	: Types.TaskStep