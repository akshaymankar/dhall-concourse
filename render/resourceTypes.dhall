let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let RenderedResource =
	  { name : Text, type : Text, source : Optional (List Types.TextTextPair) }

let renderCustomResourceType = λ(x : Types.CustomResourceType) → Some x

let renderInBuiltResourceType = λ(x : Text) → None RenderedResource

let renderResourceType
	: Types.ResourceType → List RenderedResource
	=   λ(resourceType : Types.ResourceType)
	  → Prelude.`Optional`.toList
		RenderedResource
		( merge
		  { InBuilt =
			  renderInBuiltResourceType
		  , Custom =
			  renderCustomResourceType
		  }
		  resourceType
		)

let renderResourceTypes =
		λ(resourceTypes : List Types.ResourceType)
	  → { resource_types =
			Prelude.`List`.concatMap
			Types.ResourceType
			RenderedResource
			renderResourceType
			resourceTypes
		}

in  renderResourceTypes