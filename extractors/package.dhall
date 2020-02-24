{ resourcesFromJobs =
      ./resourcesFromJobs.dhall sha256:eb61615a4847ebe2d5d9bf61d0288f088295fc845476050595e083db3b00fb2c
    ? ./resourcesFromJobs.dhall
, resourceTypesFromResources =
      ./resourcesTypesFromResources.dhall sha256:b49098518c53809ff472643c55e94399dfa789f795e77089085dad673404f223
    ? ./resourcesTypesFromResources.dhall
}
