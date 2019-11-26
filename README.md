# Dhall Concourse
Concourse types and helpers in dhall.

**Note:** A lot of this README is inspired (some of it copied) from the [dhall-kubernetes README](https://github.com/dhall-lang/dhall-kubernetes/blob/master/README.md), so thanks to the authors!

Dhall Concourse provides Dhall bindings for Concourse, so you can generate concourse pipelines from Dhall expressions. This will let you easily typecheck, template and modularize your Concourse pipelines.

## Why do I need this?

There are a lot of issues one could face while building any non-trivial pipeline. Few of them could be:
1. Pipeline yaml becomes very big and unmanageable
2. Same set of jobs are required to be run in different environments
3. Same set of hooks but with slight changes in all jobs. E.g. slack notifications, releasing resources on failure, etc.

Most common way to deal with these have been to use a templating language like erb, but it gets very messy very fast. We can do a lot better.

Dhall solves all of this, being a programming language with builtin templating, all while being non-Turing complete, strongly typed and [strongly normalizing](https://en.wikipedia.org/wiki/Normalization_property_(abstract_rewriting)) (i.e.: reduces everything to a normal form, no matter how much abstraction you build), so saving you from the _"oh-noes-I-made-my-config-in-code-and-now-its-too-abstract"_ nightmare.

For a Dhall Tutorial, see the [readme of the project](https://github.com/dhall-lang/dhall-lang), or the [full tutorial](http://hackage.haskell.org/package/dhall-1.17.0/docs/Dhall-Tutorial.html).

## Usage

### Using dhall-fly

To use dhall-concourse you need to install [dhall-fly](https://github.com/akshaymankar/dhall-fly#installation).

### Using dhall-to-json and jq (Experimental)

#### Jobs without Groups

To use native rendering to render a list of jobs in a file called `jobs.dhall`, you'd have to write a dhall expression like this:

```dhall
let Concourse = 
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/package.dhall

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
      https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/package.dhall

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

### Example 3 (Real World™)


We in the Eirini team were facing issues with templating our pipeline YAMLs. Recently, we started converting our spruce/aviator based yaml templating into dhall. The work in progress can be seen in [our CI repo](https://github.com/cloudfoundry-incubator/eirini-ci/blob/47d2f229e33d9fcdb5641cec06fa68a0d82c0bff/pipelines/ci/pipeline.dhall).
