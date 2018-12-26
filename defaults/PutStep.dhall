let PutStep
	: ./../types/PutStep.dhall
	= { put =
		  None Text
	  , resource =
		  ./Resource.dhall
	  , params =
		  None (List ./../types/TextTextPair.dhall)
	  , get_params =
		  None (List ./../types/TextTextPair.dhall)
	  }

in  PutStep