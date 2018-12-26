let Resource = ./Resource.dhall

in  { get :
		Optional Text
	, resource :
		Resource
	, params :
		Optional (List ./TextTextPair.dhall)
	, version :
		Optional ./GetVersion.dhall
	, passed :
		Optional (List Text)
	, trigger :
		Optional Bool
	}