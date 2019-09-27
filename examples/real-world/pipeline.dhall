  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Concourse =
        https://raw.githubusercontent.com/akshaymankar/dhall-concourse/with-json-exts/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d
  
  let Prelude =
        https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454
  
  let renderJobs = ../../render/jobs.dhall JSON toJSON
  
  let bumpMinorJob : Concourse.Job = ./jobs/bump-minor.dhall
  
  in  renderJobs [ bumpMinorJob ]
