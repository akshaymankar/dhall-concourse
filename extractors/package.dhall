{ resourcesFromJobs =
      ./resourcesFromJobs.dhall sha256:1f5f360dafe779863e843f9ca5aff23d1ac6fecc6a80776edf0e7717bd7448d7
    ? ./resourcesFromJobs.dhall
, resourceTypesFromResources =
      ./resourcesTypesFromResources.dhall sha256:b49098518c53809ff472643c55e94399dfa789f795e77089085dad673404f223
    ? ./resourcesTypesFromResources.dhall
}
