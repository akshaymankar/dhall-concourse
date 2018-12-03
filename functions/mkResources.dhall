let Resource = ../types/Resource.dhall
let RenderedResource = { name : Text
                       , type : Text
                       , source : Optional (List ../types/Map.dhall)
                       , version : Optional (List ../types/Map.dhall)
                       , params: Optional (List ../types/Map.dhall)
                       , check_every: Optional Text
                       , tags: Optional (List Text)
                       , webhook_token: Optional Text
                       }
let map = https://prelude.dhall-lang.org/List/map
let mkResource = \(resource : Resource) -> resource // {type = resource.type.name}
let mkResources = \(resources : List Resource)
                  -> { resources = map Resource RenderedResource mkResource resources }
in mkResources
