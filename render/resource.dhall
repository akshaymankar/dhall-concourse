let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let typeName
    : Types.ResourceType → Text
    = λ(t : Types.ResourceType) →
        merge
          { InBuilt = λ(n : Text) → n
          , Custom = λ(c : Types.CustomResourceType) → c.name
          }
          t

let render
    : Types.Resource → JSON.Type
    = λ(r : Types.Resource) →
        JSON.object
          ( toMap
              { name = JSON.string r.name
              , type = JSON.string (typeName r.type)
              , icon = RenderOptional.text r.icon
              , source = RenderOptional.jsonObject r.source
              , version = RenderOptional.textTextMap r.version
              , check_every = RenderOptional.text r.check_every
              , tags = RenderOptional.lists.text r.tags
              , public = RenderOptional.bool r.public
              , webhook_token = RenderOptional.text r.webhook_token
              }
          )

in  render
