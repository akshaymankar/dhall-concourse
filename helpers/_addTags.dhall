let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let Step = Types.Step

let StepConstructors = Types.StepConstructors

let translateHooks = ./translateHooks.dhall

let mergeTags
    : Optional (List Text) → List Text → Optional (List Text)
    = λ(origTags : Optional (List Text)) →
      λ(newTags : List Text) →
        Some
          ( merge
              { None = newTags
              , Some =
                  λ(tags : List Text) →
                    Prelude.List.concat Text [ tags, newTags ]
              }
              origTags
          )

let addTagsToGet
    : Bool → List Text → Types.GetStep → Types.StepHooks Step → Step
    = λ(addToResources : Bool) →
      λ(tags : List Text) →
      λ(g : Types.GetStep) →
      λ(h : Types.StepHooks Step) →
      λ(S : Type) →
      λ(c : StepConstructors S) →
        c.get
          (   g
            ⫽ { tags = mergeTags g.tags tags
              , resource =
                  if    addToResources
                  then  ./addTagsToResource.dhall tags g.resource
                  else  g.resource
              }
          )
          (translateHooks S c h)

let addTagsToPut
    : Bool → List Text → Types.PutStep → Types.StepHooks Step → Step
    = λ(addToResources : Bool) →
      λ(tags : List Text) →
      λ(p : Types.PutStep) →
      λ(h : Types.StepHooks Step) →
      λ(S : Type) →
      λ(c : StepConstructors S) →
        c.put
          (   p
            ⫽ { tags = mergeTags p.tags tags
              , resource =
                  if    addToResources
                  then  ./addTagsToResource.dhall tags p.resource
                  else  p.resource
              }
          )
          (translateHooks S c h)

let addTagsToTask
    : List Text → Types.TaskStep → Types.StepHooks Step → Step
    = λ(tags : List Text) →
      λ(t : Types.TaskStep) →
      λ(h : Types.StepHooks Step) →
      λ(S : Type) →
      λ(c : StepConstructors S) →
        c.task (t ⫽ { tags = mergeTags t.tags tags }) (translateHooks S c h)

let addTagsToSetPipeline
    : List Text → Types.SetPipelineStep → Types.StepHooks Step → Step
    = λ(tags : List Text) →
      λ(s : Types.SetPipelineStep) →
      λ(h : Types.StepHooks Step) →
      λ(S : Type) →
      λ(c : StepConstructors S) →
        c.set_pipeline
          (s ⫽ { tags = mergeTags s.tags tags })
          (translateHooks S c h)

let addTagsToLoadVar
    : List Text → Types.LoadVarStep → Types.StepHooks Step → Step
    = λ(tags : List Text) →
      λ(l : Types.LoadVarStep) →
      λ(h : Types.StepHooks Step) →
      λ(S : Type) →
      λ(c : StepConstructors S) →
        c.load_var (l ⫽ { tags = mergeTags l.tags tags }) (translateHooks S c h)

let addTagsToStep
    : Bool → List Text → Step → Step
    = λ(addToResources : Bool) →
      λ(tags : List Text) →
      λ(s : Step) →
        s
          Step
          { get = addTagsToGet addToResources tags
          , put = addTagsToPut addToResources tags
          , task = addTagsToTask tags
          , set_pipeline = addTagsToSetPipeline tags
          , load_var = addTagsToLoadVar tags
          , aggregate = ./aggregateWithHooks.dhall
          , do = ./doWithHooks.dhall
          , try = ./tryWithHooks.dhall
          , in_parallel = ./inParallelWithHooks.dhall
          }

let addTags
    : Bool → List Text → List Types.Job → List Types.Job
    = λ(addToResources : Bool) →
      λ(tags : List Text) →
        Prelude.List.map
          Types.Job
          Types.Job
          ( λ(j : Types.Job) →
                j
              ⫽ { plan =
                    Prelude.List.map
                      Step
                      Step
                      (addTagsToStep addToResources tags)
                      j.plan
                }
          )

in  addTags
