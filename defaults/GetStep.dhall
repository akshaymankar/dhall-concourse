let GetStep = ./../types/GetStep.dhall

let Resource = ./../types/Resource.dhall

in    { get =
		  None Text
	  , resource =
		  ./Resource.dhall
	  , params =
		  None (List ./../types/TextTextPair.dhall)
	  , version =
		  None ./../types/GetVersion.dhall
	  , passed =
		  None (List Text)
	  , trigger =
		  None Bool
	  }
	: GetStep