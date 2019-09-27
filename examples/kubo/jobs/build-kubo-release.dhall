let Concourse = ../lib/dhall-concourse/types.dhall

let Defaults = ../lib/dhall-concourse/defaults.dhall

let Helpers = ../lib/dhall-concourse/helpers.dhall

let Prelude = ../lib/prelude/package.dhall

let getKuboDeployment =
      ../steps/get-kubo-deployment.dhall
        (Some True)
        (Some [ ./run-unit-tests.dhall ])

let getKuboRelease =
      ../steps/get-kubo-release.dhall
        (Some True)
        (Some [ ./run-unit-tests.dhall ])

let getGafferSourceJSON =
      Helpers.getStep
        (   Defaults.GetStep
          ⫽ { resource = ../resources/gaffer-source-json.dhall }
        )

let getKuboVersion =
      Helpers.getStep
        (   Defaults.GetStep
          ⫽ { resource =
                ../resources/kubo-version.dhall
            , params =
                Some [ Prelude.JSON.keyText "pre" "dev" ]
            }
        )

let buildKuboRelease =
      Helpers.taskStep
        (   Defaults.TaskStep
          ⫽ { task =
                "build-kubo-release"
            , config =
                Concourse.TaskSpec.File "git-kubo-ci/tasks/build-kubo-release"
            }
        )

let generateCompilationManifest =
      Helpers.taskStep
        (   Defaults.TaskStep
          ⫽ { task =
                "generate-compilation-manifest"
            , config =
                Concourse.TaskSpec.File
                  "git-kubo-ci/tasks/generate-compilation-manifest.yml"
            }
        )

let putCompilationDeployment =
      Helpers.putStep
        (   Defaults.PutStep
          ⫽ { resource =
                ../resources/compilation-deployment.dhall
            , params =
                Some
                [ Prelude.JSON.keyText
                    "manifest"
                    "compilation-manifest/manifest.yml"
                , Prelude.JSON.keyText
                    "source_file"
                    "gaffer-source-json/source.json"
                , Prelude.JSON.keyText
                    "releases"
                    "kubo-release/kubo-release-*.tgz"
                ]
            }
        )

let export =
      Helpers.taskStep
        (   Defaults.TaskStep
          ⫽ { task =
                "export"
            , config =
                Concourse.TaskSpec.File "git-kubo-ci/tasks/export-release.yml"
            , params =
                Some [ Prelude.JSON.keyText "RELEASE_LIST" "kubo" ]
            , input_mapping =
                Some
                [ Prelude.JSON.keyText "gcs-source-json" "gaffer-source-json" ]
            }
        )

let putKuboVersion =
      Helpers.putStep
        (   Defaults.PutStep
          ⫽ { resource =
                ../resources/kubo-version.dhall
            , params =
                Some [ Prelude.JSON.keyText "pre" "dev" ]
            }
        )

let putKuboReleaseTarballUntested =
      Helpers.putStep
        (   Defaults.PutStep
          ⫽ { resource =
                ../resources/gcs-kubo-release-tarball-untested.dhall
            , params =
                Some
                [ Prelude.JSON.keyText "file" "compiled-releases/kubo-*.tgz" ]
            }
        )

in    Defaults.Job
    ⫽ { name =
          "build-kubo-release"
      , plan =
          [ Helpers.aggregateStep
              [ ../steps/get-slackers.dhall
              , ../steps/get-kubo-ci.dhall
              , getKuboDeployment
              , getKuboRelease
              , getKuboVersion
              ]
          , buildKuboRelease
          , generateCompilationManifest
          , putCompilationDeployment
          , export
          , putKuboVersion
          , putKuboReleaseTarballUntested
          ]
      }
