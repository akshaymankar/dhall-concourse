let Types = ../types/package.dhall

let RenderOptional = ./optionals/package.dhall

let JSON = (../lib/prelude.dhall).JSON

let renderFormat =
        λ(f : Types.LoadVarFormat)
      → JSON.string
          ( merge
              { detect = "detect"
              , json = "json"
              , yaml = "yaml"
              , yml = "yml"
              , raw = "raw"
              }
              f
          )

let render
    : Types.LoadVarStep → Types.JSONObject
    =   λ(l : Types.LoadVarStep)
      → toMap
          { load_var = JSON.string l.var
          , file = JSON.string l.file
          , format =
              RenderOptional.generic Types.LoadVarFormat renderFormat l.format
          , tags = RenderOptional.lists.text l.tags
          , timeout = RenderOptional.text l.timeout
          , attempts = RenderOptional.natural l.attempts
          }

in  render
