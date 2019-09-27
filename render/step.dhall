  λ(JSON : Type)
→ λ(toJSON : ∀(Value : Type) → ∀(v : Value) → JSON)
→ let Types = ../types/package.dhall
  
  let Prelude = ../lib/prelude.dhall
  
  let RenderedGet =
        { get :
            Text
        , resource :
            Optional Text
        , params :
            Optional (List Types.TextTextPair)
        , version :
            Optional Types.GetVersion
        , passed :
            Optional (List Text)
        , trigger :
            Optional Bool
        , attempts :
            Optional Natural
        , timeout :
            Optional Text
        , tags :
            Optional (List Text)
        }
  
  let RenderedPut =
        { put :
            Text
        , resource :
            Optional Text
        , params :
            Optional (List Types.TextTextPair)
        , get_params :
            Optional (List Types.TextTextPair)
        , attempts :
            Optional Natural
        , timeout :
            Optional Text
        , tags :
            Optional (List Text)
        }
  
  let calculateActionAndResource =
          λ(get : Optional Text)
        → λ(resource : Types.Resource)
        → { action =
              Optional/fold Text get Text (λ(g : Text) → g) resource.name
          , resource =
              Optional/fold
                Text
                get
                (Optional Text)
                (λ(g : Text) → Some resource.name)
                (None Text)
          }
  
  let renderGet
      : Types.GetStep → Types.StepHooks JSON → JSON
      =   λ(g : Types.GetStep)
        → λ(h : Types.StepHooks JSON)
        → let actionAndResource = calculateActionAndResource g.get g.resource
          
          in  toJSON
                (RenderedGet ⩓ Types.StepHooks JSON)
                (   g
                  ⫽ { get =
                        actionAndResource.action
                    , resource =
                        actionAndResource.resource
                    }
                  ⫽ h
                )
  
  let renderPut
      : Types.PutStep → Types.StepHooks JSON → JSON
      =   λ(p : Types.PutStep)
        → λ(h : Types.StepHooks JSON)
        → let actionAndResource = calculateActionAndResource p.put p.resource
          
          in  toJSON
                (RenderedPut ⩓ Types.StepHooks JSON)
                (   p
                  ⫽ { put =
                        actionAndResource.action
                    , resource =
                        actionAndResource.resource
                    }
                  ⫽ h
                )
  
  let RenderedTask =
        { task :
            Text
        , config :
            Optional Types.TaskConfig
        , file :
            Optional Text
        , privileged :
            Optional Bool
        , params :
            Optional (List Types.TextTextPair)
        , image :
            Optional Text
        , input_mapping :
            Optional (List Types.TextTextPair)
        , output_mapping :
            Optional (List Types.TextTextPair)
        , attempts :
            Optional Natural
        , timeout :
            Optional Text
        , tags :
            Optional (List Text)
        }
  
  let renderTaskConfig =
        λ(c : Types.TaskConfig) → { config = Some c, file = None Text }
  
  let renderTaskFile =
        λ(f : Text) → { config = None Types.TaskConfig, file = Some f }
  
  let renderTask
      : Types.TaskStep → Types.StepHooks JSON → JSON
      =   λ(t : Types.TaskStep)
        → λ(h : Types.StepHooks JSON)
        → toJSON
            (RenderedTask ⩓ Types.StepHooks JSON)
            (   t
              ⫽ ( merge
                    { Config = renderTaskConfig, File = renderTaskFile }
                    t.config
                )
              ⫽ h
            )
  
  let renderAggregate
      : List JSON → Types.StepHooks JSON → JSON
      =   λ(steps : List JSON)
        → λ(h : Types.StepHooks JSON)
        → toJSON
            ({ aggregate : List JSON } ⩓ Types.StepHooks JSON)
            ({ aggregate = steps } ⫽ h)
  
  let renderDo
      : List JSON → Types.StepHooks JSON → JSON
      =   λ(steps : List JSON)
        → λ(h : Types.StepHooks JSON)
        → toJSON
            ({ do : List JSON } ⩓ Types.StepHooks JSON)
            ({ do = steps } ⫽ h)
  
  let renderTry
      : JSON → Types.StepHooks JSON → JSON
      =   λ(step : JSON)
        → λ(h : Types.StepHooks JSON)
        → toJSON ({ try : JSON } ⩓ Types.StepHooks JSON) ({ try = step } ⫽ h)
  
  let renderStep
      : Types.Step → JSON
      =   λ(step : Types.Step)
        → step
            JSON
            renderGet
            renderPut
            renderTask
            renderAggregate
            renderDo
            renderTry
  
  in  renderStep
