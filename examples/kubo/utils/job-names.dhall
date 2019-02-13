let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let jobNames
	: List Concourse.Job → List Text
	=   λ(l : List Concourse.Job)
	  → Prelude.`List`.map Concourse.Job Text (λ(j : Concourse.Job) → j.name) l

in  jobNames