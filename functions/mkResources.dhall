let Types = ./../types/package.dhall

let RenderedResource =
	  { name :
		  Text
	  , type :
		  Text
	  , source :
		  Optional (List Types.TextTextPair)
	  , version :
		  Optional (List Types.TextTextPair)
	  , params :
		  Optional (List Types.TextTextPair)
	  , check_every :
		  Optional Text
	  , tags :
		  Optional (List Text)
	  , webhook_token :
		  Optional Text
	  }

let map = https://prelude.dhall-lang.org/List/map

let renderInbuiltResource = λ(x : Text) → x

let renderCustomResource = λ(x : Types.CustomResourceType) → x.name

let resourceTypeText =
		λ(resourceType : Types.ResourceType)
	  → merge
		{ InBuilt = renderInbuiltResource, Custom = renderCustomResource }
		resourceType

let mkResource =
		λ(resource : Types.Resource)
	  → resource ⫽ { type = resourceTypeText resource.type }

let mkResources =
		λ(resources : List Types.Resource)
	  → { resources = map Types.Resource RenderedResource mkResource resources }

in  mkResources