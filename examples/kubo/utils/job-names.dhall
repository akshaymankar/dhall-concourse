let Concourse = ../lib/dhall-concourse/types.dhall

let Prelude = ../lib/prelude/package.dhall

let jobNames
    : List Concourse.Job → List Text
    =   λ(l : List Concourse.Job)
      → Prelude.List.map Concourse.Job Text (λ(j : Concourse.Job) → j.name) l

in  jobNames
