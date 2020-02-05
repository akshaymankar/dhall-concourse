{ taskStep =
      ./taskStep.dhall sha256:f7c597fd8d12cb09915aa2f69197425b70cdd02228f60204fc1fb6ebd7752ba8
    ? ./taskStep.dhall
, putStep =
      ./putStep.dhall sha256:2acca50d8b5ddc509ecbe9f5e5cb3cb1c7b16afcafc3be19832dc83277c7ba29
    ? ./putStep.dhall
, getStep =
      ./getStep.dhall sha256:6450e6470d5d5c0874ace985cd7fc6e68c30c6b2ee96627e407709bac3d444c5
    ? ./getStep.dhall
, aggregateStep =
      ./aggregateStep.dhall sha256:627ed574a25f46d86ce17dcac7a9a1d3a7091d99615420933357c241a575274a
    ? ./aggregateStep.dhall
, inParallelStep =
      ./inParallelStep.dhall sha256:4b06b441eef8f7596882276125c956ac371f544d9d162de118bd8909fc483103
    ? ./inParallelStep.dhall
, inParallelStepSimple =
      ./inParallelStepSimple.dhall sha256:f2163a83a674d4dcffa87d15743a071624b17c6709fe467e67e432e527de97c2
    ? ./inParallelStepSimple.dhall
, doStep =
      ./doStep.dhall sha256:644a08ced3e2bfd7d7ceb929e5067d3a73add378f7b07a6740b5791a791933b9
    ? ./doStep.dhall
, tryStep =
      ./tryStep.dhall sha256:29da9af3ac4f2a0eb01e606f74f26955f2026b37dac45e6d94bb8b3c63d56973
    ? ./tryStep.dhall
, getWithHooks =
      ./getWithHooks.dhall sha256:6377b5f418be65a327dfd534447b5407224e83920cf0bc9e51993ad5716f2bbc
    ? ./getWithHooks.dhall
, putWithHooks =
      ./putWithHooks.dhall sha256:6e6a8fb0efab92daa34c3181ff58ca8710a1ebab7c8e4031158ca86788bfafdf
    ? ./putWithHooks.dhall
, taskWithHooks =
      ./taskWithHooks.dhall sha256:bf644425ed58b4284a52c64cc8b7e7c518fe1cfc53bf0b6bf02b9504e42994e1
    ? ./taskWithHooks.dhall
, inParallelWithHooks =
      ./inParallelWithHooks.dhall sha256:135ba901c508c01049b61e1eb9d5d2e24651f83d6a6d253d7db7e77b851f4ef0
    ? ./inParallelWithHooks.dhall
, aggregateWithHooks =
      ./aggregateWithHooks.dhall sha256:643c580f6cc4c543f017cf8c833626d76d8bed7e9b30b9e626a0ae7107337074
    ? ./aggregateWithHooks.dhall
, doWithHooks =
      ./doWithHooks.dhall sha256:b708423223579f16191c0d2d23be72cc2ccb083b676d695c62b74d7b9c675841
    ? ./doWithHooks.dhall
, tryWithHooks =
      ./tryWithHooks.dhall sha256:8e53c7c7d7f95942392162bb15b8f5ac6d3e242966b0c9ef6ff16f2a0953f3e6
    ? ./tryWithHooks.dhall
}
