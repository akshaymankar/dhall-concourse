let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Helpers = ../lib/dhall-concourse/helpers.dhall

let Prelude = ../lib/prelude/package.dhall

let upstreamJobs = [ ./build-kubo-release.dhall ]

let passed = Some upstreamJobs

let getKuboDeployment = ../steps/get-kubo-deployment.dhall (None Bool) passed

let getKuboRelease = ../steps/get-kubo-release.dhall (None Bool) passed

let getKuboVersion =
      Helpers.getStep
        (   Defaults.GetStep
          ⫽ { resource = ../resources/kubo-version.dhall
            , passed = Some (../utils/job-names.dhall upstreamJobs)
            }
        )

let buildKuboDeploymentTarball =
      Helpers.taskStep
        (   Defaults.TaskStep
          ⫽ { task = "build-kubo-deployment-tarball"
            , config =
                Concourse.TaskSpec.File
                  "git-kubo-ci/tasks/build-kubo-deployment-tarball.yml"
            }
        )

let putKuboDeploymentTarballUntested =
      Helpers.putStep
        (   Defaults.PutStep
          ⫽ { resource = ../resources/gcs-kubo-deployment-tarball-untested.dhall
            , params =
                Some
                [ Prelude.JSON.keyText
                    "file"
                    "kubo-deployment-tarball/kubo-deployment*.tgz"
                ]
            }
        )

in    Defaults.Job
    ⫽ { name = "package-kubo-deployment-tarball"
      , plan =
          [ Helpers.aggregateStep
              [ ../steps/get-slackers.dhall
              , ../steps/get-kubo-ci.dhall
              , getKuboDeployment
              , getKuboRelease
              , getKuboVersion
              ]
          , buildKuboDeploymentTarball
          , putKuboDeploymentTarballUntested
          ]
      }
