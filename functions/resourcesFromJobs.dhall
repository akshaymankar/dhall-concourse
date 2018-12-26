let Prelude =
	  https://prelude.dhall-lang.org/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

let Types = ./../types/package.dhall

let resourceFromGetStep = λ(g : Types.GetStep) → Some g.resource

let resourceFromPutStep = λ(p : Types.PutStep) → Some p.resource

let resourceFromTaskStep = λ(_ : Types.TaskStep) → None Types.Resource

let resourcesFromBasicStep =
		λ(b : Types.BasicStep)
	  → Prelude.`Optional`.toList
		Types.Resource
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

let resourcesFromAggregateStep =
	  Prelude.`List`.concatMap
	  Types.BasicStep
	  Types.Resource
	  resourcesFromBasicStep

let resourcesFromStep =
		λ(s : Types.Step)
	  → merge
		{ Basic =
			resourcesFromBasicStep
		, Aggregate =
			resourcesFromAggregateStep
		}
		s

let resourcesFromJob =
		λ(j : Types.Job)
	  → Prelude.`List`.concatMap
		Types.Step
		Types.Resource
		resourcesFromStep
		j.plan

let resourcesFromJobs =
	  Prelude.`List`.concatMap Types.Job Types.Resource resourcesFromJob

in  resourcesFromJobs