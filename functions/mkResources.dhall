let Resource = ./../types/Resource.dhall

let RenderedResource =
	  { name :
		  Text
	  , type :
		  Text
	  , source :
		  Optional (List ./../types/TextTextPair.dhall)
	  , version :
		  Optional (List ./../types/TextTextPair.dhall)
	  , params :
		  Optional (List ./../types/TextTextPair.dhall)
	  , check_every :
		  Optional Text
	  , tags :
		  Optional (List Text)
	  , webhook_token :
		  Optional Text
	  }

let map = https://prelude.dhall-lang.org/List/map

let ResourceType = ./../types/ResourceType.dhall

let CustomResourceType = ./../types/CustomResourceType.dhall

let renderInbuiltResource = λ(x : Text) → x

let renderCustomResource = λ(x : CustomResourceType) → x.name

let resourceTypeText =
		λ(resourceType : ResourceType)
	  → merge
		{ InBuilt = renderInbuiltResource, Custom = renderCustomResource }
		resourceType

let mkResource =
		λ(resource : Resource)
	  → resource ⫽ { type = resourceTypeText resource.type }

let mkResources =
		λ(resources : List Resource)
	  → { resources = map Resource RenderedResource mkResource resources }

in  mkResources