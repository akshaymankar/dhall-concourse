# Dhall Concourse
Concourse types and helpers in dhall.

Dhall Concourse provides Dhall bindings for Concourse, so you can generate concourse pipelines from Dhall expressions. This lets the pipelines be easily typechecked, templated and modularized.

## Why do I need this?

There are a lot of issues one could face while building any non-trivial pipeline. Few of them could be:
1. Pipeline yaml becomes very big and unmanageable
2. Same set of jobs are required to be run in different environments
3. Same set of hooks but with slight changes in all jobs. E.g. slack notifications, releasing resources on failure, etc.

Most common ways to deal with these have been to use a templating language like erb or tools like spruce. But this gets very messy very fast. We can do a lot better with a typed total language. I'll let [dhall speak for itself](https://dhall-lang.org/).

## Usage

### Using dhall-fly

One way to translate pipelines written in dhall-concourse into yaml is using [dhall-fly](https://github.com/akshaymankar/dhall-fly#installation).

### Using dhall-to-json and jq

#### Jobs without Groups

To use native rendering to render a list of jobs in a file called `jobs.dhall`, you'd have to write a dhall expression like this:

```dhall
let Concourse = 
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.6.0/package.dhall

let jobs = ./jobs.dhall

in Concourse.render.pipeline jobs
```

Now you can render this using dhall-to-json and jq like this:

```bash
dhall-to-json <<< './pipeline.dhall' \
  | jq '.resources = (.resources|unique)' \
  | jq '.resource_types = (.resource_types|unique)'
```

#### Jobs with groups

Similarly, to render a list of `GroupedJob`s in a filed called `grouped-jobs.dhall`, this would be the expression to render:

```dhall
let Concourse = 
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.6.0/package.dhall

let groupedJobs = ./grouped-jobs.dhall

in Concourse.render.groupedJobs groupedJobs
```

Now you can render this using dhall-to-json and jq like this:

```bash
dhall-to-json <<< './pipeline.dhall' \
  | jq '.resources = (.resources|unique)' \
  | jq '.resource_types = (.resource_types|unique)' \
  | jq '.groups = (.groups | group_by(.name) | map({name: .[0].name, jobs: (map(.jobs) | flatten) }))'
```

## Defining a pipeline

### Example 1: Hello World

This dhall expression will create a pipeline with one job, which would have one task. The task would run in a busybox container and echo "Hello Dhall".

```dhall
let Concourse =
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/package.dhall

let Prelude =
      https://prelude.dhall-lang.org/v11.1.0/package.dhall sha256:99462c205117931c0919f155a6046aec140c70fb8876d208c7c77027ab19c2fa

let busyboxImage =
      Concourse.schemas.ImageResource::{
      , type = "docker-image"
      , source = Some (toMap { repository = Prelude.JSON.string "busybox" })
      }

let job =
      Concourse.schemas.Job::{
      , name = "hello"
      , plan =
          [ Concourse.helpers.taskStep
              Concourse.schemas.TaskStep::{
              , task = "hello"
              , config =
                  Concourse.Types.TaskSpec.Config
                    Concourse.schemas.TaskConfig::{
                    , image_resource = Some busyboxImage
                    , run =
                        Concourse.schemas.TaskRunConfig::{
                        , path = "bash"
                        , args = Some [ "-c", "echo Hello Dhall" ]
                        }
                    }
              }
          ]
      }

in  [ job ]
```

To set the pipeline, run this command:

```
fly -t <TARGET> set-pipeline -p hello-dhall -c <(dhall-fly <example1.dhall)
```

### Example 2 (Hello World with groups)

```dhall
let Concourse =
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/package.dhall

let Prelude =
      https://prelude.dhall-lang.org/v11.1.0/package.dhall sha256:99462c205117931c0919f155a6046aec140c70fb8876d208c7c77027ab19c2fa

-- Assuming above file is here
let jobs = ./example1.dhall

in  Prelude.List.map
      Concourse.Types.Job
      Concourse.Types.GroupedJob
      (λ(j : Concourse.Types.Job) → { job = j, groups = [ "hello-world" ] })
      jobs
```

To notify `dhall-fly` that we'd be passing it a `List Concourse.Types.GroupedJob` instead of `List Concourse.Types.Job`, we have to call it with `--pipeline-type grouped-jobs` like this:
```
fly -t <TARGET> set-pipeline -p hello-dhall -c <(dhall-fly --pipeline-type grouped-jobs <example1.dhall)
```


### Example 3: Pipeline for this repository

The pipeline is defined in [./ci/pipeline.dhall](./ci/pipeline.dhall). 

The script [./ci/set-pipeline.sh](./ci/set-pipeline.sh) is used to set the pipeline. 

The pipeline can be viewed [here](https://concourse.gdn/teams/main/pipelines/dhall-concourse).

## Why are Steps so complicated?

In concourse, a step can be one of `get`, `put`, `task`, `in_parallel`, `aggregate`, `do` or `try`. The `in_parallel`, `do` and `aggregate` are list of steps, `try` represents one step. This makes definition of the `Step` type recursive, as in to define a `Step` we'd already need definition of a Step. In total languages like dhall, this is a little tricky to do. There is an explanation in [dhall docs about how to do this](https://docs.dhall-lang.org/howtos/How-to-translate-recursive-code-to-Dhall.html). An example of this can be found in dhall prelude's definition of the [JSON Type](https://github.com/dhall-lang/dhall-lang/blob/master/Prelude/JSON/Type)

**But there is more!**: Each step can also have 4 types of `hooks`: `on_failure`, `on_success`, `on_abort` and `ensure`. Each of these is optional and you guessed it, is of type Step.

So, I decided the type definition for `Step` would look like this:

```dhall
let StepHooks =
        λ(Step : Type)
      → { on_failure : Optional Step
        , on_success : Optional Step
        , on_abort : Optional Step
        , ensure : Optional Step
        }

let StepConstructors =
        λ(Step : Type)
      → { get : ./GetStep.dhall → StepHooks Step → Step
        , put : ./PutStep.dhall → StepHooks Step → Step
        , task : ./TaskStep.dhall → StepHooks Step → Step
        , aggregate : List Step → StepHooks Step → Step
        , in_parallel : ./InParallelStep.dhall → StepHooks Step → Step
        , do : Step → StepHooks Step → Step
        , try : Step → StepHooks Step → Step
        }

in  ∀(Step : Type) → StepConstructors Step → Step

```

The way I read it is, a Step is defined for any type for which one can provide constructors for get, put, task, aggregate, etc.

This is the reason this repository includes helpers to construct steps with or without hooks.
