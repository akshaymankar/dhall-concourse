let Resource = ./../types/Resource.dhall

in  { put :
		Optional Text
	, resource :
		Resource
	, params :
		Optional (List ./TextTextPair.dhall)
	, get_params :
		Optional (List ./TextTextPair.dhall)
	}