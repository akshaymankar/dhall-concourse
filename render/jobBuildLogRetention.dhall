let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let render =
        λ(r : Types.JobBuildLogRetention)
      → JSON.object
          ( toMap
              { days = RenderOptional.natural r.days
              , builds = RenderOptional.natural r.builds
              }
          )

in  render
