{ resourcesFromJobs =
      ./resourcesFromJobs.dhall sha256:ea5a4c504ad6777935990388aa542347082076200d3125620450d978743e4dd7
    ? ./resourcesFromJobs.dhall
, resourceTypesFromResources =
      ./resourcesTypesFromResources.dhall sha256:b49098518c53809ff472643c55e94399dfa789f795e77089085dad673404f223
    ? ./resourcesTypesFromResources.dhall
}
