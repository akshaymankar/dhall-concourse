let Job = ./../types/Job.dhall

let Step = ./../types/Step.dhall

let GetStep = ./../types/GetStep.dhall

let PutStep = ./../types/PutStep.dhall

let TaskStep = ./../types/TaskStep.dhall

let BasicStep = ./../types/BasicStep.dhall

let Resource = ./../types/Resource.dhall

let resourceFromGetStep = λ(g : GetStep) → Some g.resource

let resourceFromPutStep = λ(p : PutStep) → Some p.resource

let resourceFromTaskStep = λ(_ : TaskStep) → None Resource

let Optional/toList = https://prelude.dhall-lang.org/Optional/toList

let resourcesFromBasicStep =
		λ(b : BasicStep)
	  → Optional/toList
		Resource
		( merge
		  { Get =
			  resourceFromGetStep
		  , Put =
			  resourceFromPutStep
		  , Task =
			  resourceFromTaskStep
		  }
		  b
		)

let List/concatMap = https://prelude.dhall-lang.org/List/concatMap

let resourcesFromAggregateStep =
	  List/concatMap BasicStep Resource resourcesFromBasicStep

let resourcesFromStep =
		λ(s : Step)
	  → merge
		{ Basic =
			resourcesFromBasicStep
		, Aggregate =
			resourcesFromAggregateStep
		}
		s

let resourcesFromJob =
	  λ(j : Job) → List/concatMap Step Resource resourcesFromStep j.plan

let resourcesFromJobs = List/concatMap Job Resource resourcesFromJob

in  resourcesFromJobs