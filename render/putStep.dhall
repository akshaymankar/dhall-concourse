let Types = ../types/package.dhall

let nameResource = ./helpers/name-resource.dhall

let RenderOptional = ./optionals/package.dhall

let render
    : Types.PutStep → Types.JSONObject
    =   λ(p : Types.PutStep)
      → toMap
          { get = nameResource.getName p.put p.resource
          , resource = nameResource.getResource p.put p.resource
          , inputs = RenderOptional.lists.text p.inputs
          , params = RenderOptional.jsonObject p.params
          , get_params = RenderOptional.jsonObject p.get_params
          , tags = RenderOptional.lists.text p.tags
          , timeout = RenderOptional.text p.timeout
          , attempts = RenderOptional.natural p.attempts
          }

in  render
