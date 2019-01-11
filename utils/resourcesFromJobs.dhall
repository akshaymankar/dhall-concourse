let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let Resource = Types.Resource

let StepHooks = Types.StepHooks

let catOptionals
	: ∀(x : Type) → List (Optional x) → List x
	=   λ(x : Type)
	  → λ(os : List (Optional x))
	  → Prelude.`List`.fold
		(Optional x)
		os
		(List x)
		(λ(a : Optional x) → λ(l : List x) → Prelude.`Optional`.toList x a # l)
		([] : List x)

let resourcesFromStepHooks
	: StepHooks (List Resource) → List Resource
	=   λ(h : StepHooks (List Resource))
	  → let listOfListOfResources =
			  catOptionals
			  (List Resource)
			  [ h.ensure, h.on_success, h.on_failure, h.on_abort ]

		in  Prelude.`List`.concat Resource listOfListOfResources

let resourcesFromGetStep
	: Types.GetStep → StepHooks (List Resource) → List Resource
	=   λ(g : Types.GetStep)
	  → λ(h : StepHooks (List Resource))
	  → [ g.resource ] # resourcesFromStepHooks h

let resourcesFromPutStep
	: Types.PutStep → StepHooks (List Resource) → List Resource
	=   λ(p : Types.PutStep)
	  → λ(h : StepHooks (List Resource))
	  → [ p.resource ] # resourcesFromStepHooks h

let resourcesFromTaskStep
	: Types.TaskStep → StepHooks (List Resource) → List Resource
	=   λ(_ : Types.TaskStep)
	  → λ(h : StepHooks (List Resource))
	  → resourcesFromStepHooks h

let resourcesFromAggregateOrDo
	: List (List Resource) → StepHooks (List Resource) → List Resource
	=   λ(rs : List (List Resource))
	  → λ(h : StepHooks (List Resource))
	  → Prelude.`List`.concat Resource rs # resourcesFromStepHooks h

let resourcesFromTry
	: List Resource → StepHooks (List Resource) → List Resource
	=   λ(rs : List Resource)
	  → λ(h : StepHooks (List Resource))
	  → rs # resourcesFromStepHooks h

let resourcesFromStep =
		λ(s : Types.Step)
	  → s
		(List Resource)
		resourcesFromGetStep
		resourcesFromPutStep
		resourcesFromTaskStep
		resourcesFromAggregateOrDo
		resourcesFromAggregateOrDo
		resourcesFromTry

let resourcesFromJob =
		λ(j : Types.Job)
	  → Prelude.`List`.concatMap Types.Step Resource resourcesFromStep j.plan

in    Prelude.`List`.concatMap Types.Job Resource resourcesFromJob
	: List Types.Job → List Resource