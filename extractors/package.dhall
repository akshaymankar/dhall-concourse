{ resourcesFromJobs =
      ./resourcesFromJobs.dhall sha256:8a625908d0d5599b9b52b8800e183f2f1a8ee179ec541dfede9f59e6d2573b6b
    ? ./resourcesFromJobs.dhall
, resourceTypesFromResources =
      ./resourcesTypesFromResources.dhall sha256:4979de9c830538c5af89a8a230d21131a85112c8401471df46ab89055f423476
    ? ./resourcesTypesFromResources.dhall
}
