let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let renderFile = λ(f : Text) → toMap { file = JSON.string f }

let renderConfig =
      λ(c : Types.TaskConfig) → toMap { config = ./taskConfig.dhall c }

let render
    : Types.TaskSpec → Types.JSONObject
    =   λ(s : Types.TaskSpec)
      → merge { File = renderFile, Config = renderConfig } s

in  render
