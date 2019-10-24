let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let renderInBuilt = λ(ignored : Text) → None JSON.Type

let renderCustom =
        λ(c : Types.CustomResourceType)
      → Some
          ( JSON.object
              ( toMap
                  { name = JSON.string c.name
                  , type = JSON.string c.type
                  , source = RenderOptional.jsonObject c.source
                  , privileged = RenderOptional.bool c.privileged
                  , params = RenderOptional.jsonObject c.params
                  , check_every = RenderOptional.text c.check_every
                  , tags = RenderOptional.text c.tags
                  , unique_version_history =
                      RenderOptional.bool c.unique_version_history
                  }
              )
          )

in    λ(r : Types.ResourceType)
    → merge { InBuilt = renderInBuilt, Custom = renderCustom } r
