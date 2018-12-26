let Resource = ./../types/Resource.dhall

let CustomResourceType = ./../types/CustomResourceType.dhall

let RenderedResource =
	  { name :
		  Text
	  , type :
		  Text
	  , source :
		  Optional (List ./../types/TextTextPair.dhall)
	  }

let map = https://prelude.dhall-lang.org/List/map

let renderCustomResourceType = λ(x : CustomResourceType) → [ x ]

let renderInbuiltResourceType = λ(x : Text) → [] : List RenderedResource

let mkResourceType =
		λ(resource : Resource)
	  → merge
		{ InBuilt =
			renderInbuiltResourceType
		, Custom =
			renderCustomResourceType
		}
		resource.type

let List/concatMap = https://prelude.dhall-lang.org/List/concatMap

let mkResourceTypes =
		λ(resources : List Resource)
	  → { resource_types =
			List/concatMap Resource RenderedResource mkResourceType resources
		}

in  mkResourceTypes