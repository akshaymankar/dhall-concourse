let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let RenderedResource =
      { name : Text, type : Text, source : Optional ../types/JSONObject.dhall }

let renderCustomResourceType = λ(x : Types.CustomResourceType) → Some x

let renderInBuiltResourceType = λ(x : Text) → None RenderedResource

let renderResourceType
    : Types.ResourceType → List RenderedResource
    =   λ(resourceType : Types.ResourceType)
      → Prelude.Optional.toList
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
            Prelude.List.concatMap
              Types.ResourceType
              RenderedResource
              renderResourceType
              resourceTypes
        }

in  renderResourceTypes
