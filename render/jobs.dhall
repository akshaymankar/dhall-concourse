let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

in  λ(js : List Types.Job) →
      Prelude.JSON.array
        (Prelude.List.map Types.Job Prelude.JSON.Type ./job.dhall js)
