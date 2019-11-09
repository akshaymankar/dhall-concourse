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
}
