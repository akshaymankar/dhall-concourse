let Resource = ../types/Resource.dhall
let RenderedResource = { name : Text
                       , type : Text
                       , source : Optional (List ../types/Map.dhall)
                       }
let map = https://prelude.dhall-lang.org/List/map
let mkResourceType =
      \(resource : Resource) -> resource.type
let mkResourceTypes = \(resources : List Resource)
                      -> { resource_types = map Resource RenderedResource mkResourceType resources }
in mkResourceTypes
