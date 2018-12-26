let Types = ./../types/package.dhall

let PutStep
	: Types.PutStep
	= { put =
		  None Text
	  , resource =
		  ./Resource.dhall
	  , params =
		  None (List Types.TextTextPair)
	  , get_params =
		  None (List Types.TextTextPair)
	  }

in  PutStep