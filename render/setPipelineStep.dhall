let Types = ../types/package.dhall

let RenderOptional = ./optionals/package.dhall

let JSON = (../lib/prelude.dhall).JSON

let render
    : Types.SetPipelineStep → Types.JSONObject
    =   λ(s : Types.SetPipelineStep)
      → toMap
          { set_pipeline = JSON.string s.set_pipeline
          , file = JSON.string s.file
          , vars = RenderOptional.jsonObject s.vars
          , var_files = RenderOptional.lists.text s.var_files
          , tags = RenderOptional.lists.text s.tags
          , timeout = RenderOptional.text s.timeout
          , attempts = RenderOptional.natural s.attempts
          }

in  render
