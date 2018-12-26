let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let RenderedResource =
	  { name : Text, type : Text, source : Optional (List Types.TextTextPair) }

let renderCustomResourceType = λ(x : Types.CustomResourceType) → [ x ]

let renderInbuiltResourceType = λ(x : Text) → [] : List RenderedResource

let mkResourceType =
		λ(resource : Types.Resource)
	  → merge
		{ InBuilt =
			renderInbuiltResourceType
		, Custom =
			renderCustomResourceType
		}
		resource.type

let mkResourceTypes =
		λ(resources : List Types.Resource)
	  → { resource_types =
			Prelude.`List`.concatMap
			Types.Resource
			RenderedResource
			mkResourceType
			resources
		}

in  mkResourceTypes