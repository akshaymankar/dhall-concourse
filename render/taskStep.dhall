let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let TextJSONPair = { mapKey : Text, mapValue : JSON.Type }

let render
    : Types.TaskStep → Types.JSONObject
    =   λ(t : Types.TaskStep)
      → Prelude.List.concat
          TextJSONPair
          [ toMap
              { task = JSON.string t.task
              , privileged = RenderOptional.bool t.privileged
              , vars = RenderOptional.jsonObject t.vars
              , params = RenderOptional.textTextMap t.params
              , image = RenderOptional.text t.image
              , input_mapping = RenderOptional.textTextMap t.input_mapping
              , output_mapping = RenderOptional.textTextMap t.output_mapping
              , tags = RenderOptional.lists.text t.tags
              , timeout = RenderOptional.text t.timeout
              , attempts = RenderOptional.natural t.attempts
              }
          , ./taskSpec.dhall t.config
          ]

in  render
