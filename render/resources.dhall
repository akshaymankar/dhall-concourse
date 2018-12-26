let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let map = Prelude.`List`.map

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

let renderInBuiltResource = λ(x : Text) → x

let renderCustomResource = λ(x : Types.CustomResourceType) → x.name

let resourceTypeText =
		λ(resourceType : Types.ResourceType)
	  → merge
		{ InBuilt = renderInBuiltResource, Custom = renderCustomResource }
		resourceType

let renderResource =
		λ(resource : Types.Resource)
	  → resource ⫽ { type = resourceTypeText resource.type }

let renderResources =
		λ(resources : List Types.Resource)
	  → { resources =
			map Types.Resource RenderedResource renderResource resources
		}

in  renderResources