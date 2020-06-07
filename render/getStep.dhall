let Types = ../types/package.dhall

let nameResource = ./helpers/name-resource.dhall

let RenderOptional = ./optionals/package.dhall

let render
    : Types.GetStep → Types.JSONObject
    = λ(g : Types.GetStep) →
        toMap
          { get = nameResource.getName g.get g.resource
          , resource = nameResource.getResource g.get g.resource
          , params = RenderOptional.jsonObject g.params
          , version =
              RenderOptional.generic
                Types.GetVersion
                ./getVersion.dhall
                g.version
          , passed = RenderOptional.lists.text g.passed
          , trigger = RenderOptional.bool g.trigger
          , tags = RenderOptional.lists.text g.tags
          , timeout = RenderOptional.text g.timeout
          , attempts = RenderOptional.natural g.attempts
          }

in  render
