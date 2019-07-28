let Types = ../types/package.dhall

in    { task =
		  "CHANGEME"
	  , config =
		  Types.TaskSpec.Config ./TaskConfig.dhall
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
	  , tags =
		  None (List Text)
	  , timeout =
		  None Text
	  , attempts =
		  None Natural
	  }
	: Types.TaskStep
