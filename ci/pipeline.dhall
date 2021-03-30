let Concourse = ../package.dhall

let Prelude = ../lib/prelude.dhall

let mainBranch =
      Concourse.schemas.Resource::{
      , name = "main"
      , type = Concourse.Types.ResourceType.InBuilt "git"
      , icon = Some "git"
      , source = Some
          ( toMap
              { uri =
                  Prelude.JSON.string
                    "https://github.com/akshaymankar/dhall-concourse"
              }
          )
      }

let testTask =
      λ(repo : Concourse.Types.Resource) →
        Concourse.helpers.taskStep
          Concourse.schemas.TaskStep::{
          , task = "test"
          , config =
              Concourse.Types.TaskSpec.Config
                Concourse.schemas.TaskConfig::{
                , image_resource = Some Concourse.schemas.ImageResource::{
                  , type = "registry-image"
                  , source = Some
                      ( toMap
                          { repository = Prelude.JSON.string "nixos/nix"
                          , tag = Prelude.JSON.string "latest"
                          }
                      )
                  }
                , inputs = Some
                  [ Concourse.schemas.TaskInput::{ name = repo.name } ]
                , run = Concourse.schemas.TaskRunConfig::{
                  , path = "sh"
                  , args = Some
                    [ "-c"
                    , ./test.sh as Text
                    , let dollarZero = "test.sh" in dollarZero
                    , repo.name
                    ]
                  }
                }
          }

let mainBranchJob =
      Concourse.schemas.Job::{
      , name = "main"
      , plan =
        [ Concourse.helpers.getStep
            Concourse.schemas.GetStep::{
            , resource = mainBranch
            , trigger = Some True
            }
        , testTask mainBranch
        ]
      }

let prResource =
      Concourse.schemas.CustomResourceType::{
      , name = "github-pr"
      , type = "registry-image"
      , source = Some
          ( toMap
              { repository = Prelude.JSON.string "teliaoss/github-pr-resource" }
          )
      }

let pr =
      Concourse.schemas.Resource::{
      , name = "pr"
      , type = Concourse.Types.ResourceType.Custom prResource
      , icon = Some "source-pull"
      , source = Some
          ( toMap
              { repository = Prelude.JSON.string "akshaymankar/dhall-concourse"
              , access_token = Prelude.JSON.string "((github-access-token))"
              , labels = Prelude.JSON.array [ Prelude.JSON.string "ok-to-test" ]
              }
          )
      }

let checkContext = "tests"

let markCheckPending =
      Concourse.helpers.putStep
        Concourse.schemas.PutStep::{
        , put = Some "mark-pending"
        , resource = pr
        , inputs = Some [ pr.name ]
        , params = Some
            ( toMap
                { path = Prelude.JSON.string pr.name
                , status = Prelude.JSON.string "PENDING"
                , context = Prelude.JSON.string checkContext
                , description =
                    Prelude.JSON.string "waiting for tests to finish"
                }
            )
        }

let markCheckSuccess =
      Concourse.helpers.putStep
        Concourse.schemas.PutStep::{
        , put = Some "mark-success"
        , resource = pr
        , inputs = Some [ pr.name ]
        , params = Some
            ( toMap
                { path = Prelude.JSON.string pr.name
                , status = Prelude.JSON.string "SUCCESS"
                , context = Prelude.JSON.string checkContext
                }
            )
        }

let markCheckFailure =
      Concourse.helpers.putStep
        Concourse.schemas.PutStep::{
        , put = Some "mark-failure"
        , resource = pr
        , inputs = Some [ pr.name ]
        , params = Some
            ( toMap
                { path = Prelude.JSON.string pr.name
                , status = Prelude.JSON.string "FAILURE"
                , context = Prelude.JSON.string checkContext
                }
            )
        }

let prJob =
      Concourse.schemas.Job::{
      , name = "pull-requests"
      , public = Some True
      , plan =
        [ Concourse.helpers.getStep
            Concourse.schemas.GetStep::{ resource = pr, trigger = Some True }
        , markCheckPending
        , Concourse.helpers.addHooks
            (testTask pr)
            Concourse.schemas.StepHooks::{
            , on_success = Some markCheckSuccess
            , on_failure = Some markCheckFailure
            }
        ]
      }

in  Concourse.render.pipeline [ mainBranchJob, prJob ]
