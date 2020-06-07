let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render
    : Types.ImageResource → JSON.Type
    = λ(r : Types.ImageResource) →
        JSON.object
          ( toMap
              { type = JSON.string r.type
              , source = RenderOptional.jsonObject r.source
              , params = RenderOptional.jsonObject r.params
              , version = RenderOptional.textTextMap r.version
              }
          )

in  RenderOptional.generic Types.ImageResource render
