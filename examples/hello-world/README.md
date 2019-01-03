# Hello World Pipeline in Dhall

Let's say we want to make a hello world pipeline in concourse. In YAML the config could look like this:

```yaml
jobs:
  name: job-hello-world
  public: true
  plan:
  - task: hello-world
    config:
      platform: linux
      image_resource:
        type: docker-image
        source: {repository: busybox}
      run:
        path: echo
        args:
        - hello world
```
It could be written like this in dhall:

```haskell
let Concourse =
    https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:e650572bc57dd08b210ee556a47dc73528b10d15646517c924fcd34d7dc7c05d

let Defaults =
    https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:c8d049dbb874ec4c853d2b481a34c5cf5aa63fb2e498a48ada5a11044062f741

let Render =
    https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/render/package.dhall sha256:f85b5de5d16e8a465765a9828be987237e023acacad4e0647319a058b7365c64

let Helpers =
    https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/helpers/package.dhall sha256:0e187d36c53f92d23ba80971777484f9130be2a2b5a9d9911cb5956f8cfccb72

let busyBoxImageResource =
    Defaults.ImageResource
    ⫽ { type =
      "docker-image"
    , source =
      [ { mapKey = "repository", mapValue = "busybox" } ]
    }

let helloWorldTaskConfig =
    Defaults.TaskConfig
    ⫽ { image_resource =
      Some busyBoxImageResource
    , run =
        Defaults.TaskRunConfig
      ⫽ { path = "echo", args = Some [ "hello world" ] }
    }

let helloWorldTask =
    Helpers.basicTask
    (   Defaults.TaskStep
    ⫽ { task =
        "hello-world"
      , config =
        Concourse.TaskSpec.Config helloWorldTaskConfig
      }
    )

let helloWorldJob =
    Defaults.Job
    ⫽ { name = "hello-world", public = Some True, plan = [ helloWorldTask ] }

in  Render.jobs [ helloWorldJob ]
```

It sure looks longer, but every `let ` in the code above can be split into another file. In this example, it is probably not very useful as it is a simple example. But if we want to make a more complex pipeline, the value grows with every new step in the job and every new job in the pipeline.
