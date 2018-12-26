let TaskStep = ./../types/TaskStep.dhall

in    { task =
		  "CHANGEME"
	  , config =
		  ./TaskConfig.dhall
	  , privileged =
		  None Bool
	  , params =
		  None (List ./../types/TextTextPair.dhall)
	  , image =
		  None Text
	  , input_mapping =
		  None (List ./../types/TextTextPair.dhall)
	  , output_mapping =
		  None (List ./../types/TextTextPair.dhall)
	  }
	: TaskStep