{ resourcesFromJobs =
      ./resourcesFromJobs.dhall sha256:ebae6ead8ad17037884f99e10136782cf705f534eba9d41f06ed0d6db6e34ad0
    ? ./resourcesFromJobs.dhall
, resourceTypesFromResources =
      ./resourcesTypesFromResources.dhall sha256:b49098518c53809ff472643c55e94399dfa789f795e77089085dad673404f223
    ? ./resourcesTypesFromResources.dhall
}
