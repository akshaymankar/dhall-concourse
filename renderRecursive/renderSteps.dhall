let Types = ../types/package.dhall

let renderStep = ./step.dhall

let List/map = https://prelude.dhall-lang.org/List/map

let renderSteps
	: List Types.Step → JSON
	=   λ(steps : List Types.Step)
	  → toJSON (List JSON) (List/map Types.Step JSON renderStep steps)

in  renderSteps