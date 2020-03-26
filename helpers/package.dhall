{ taskStep =
      ./taskStep.dhall sha256:cc48a8da17f79686e4b93e9efa40a7bc7e6e43821d4fe0c2ba8d4f66d7bc4e2b
    ? ./taskStep.dhall
, putStep =
      ./putStep.dhall sha256:4bef3f3b89292cf2f8d803526cc9201bd690b485b180ed28820931cadc51bbd1
    ? ./putStep.dhall
, getStep =
      ./getStep.dhall sha256:5adc9cfb7262cc50b53a59577d3cde0aa61fba5f03ba3fa01e9b155fca8206dc
    ? ./getStep.dhall
, setPipelineStep =
      ./setPipelineStep.dhall sha256:332af03c7f04b5ea124aa75120abd974a8ed2059997aa4ccd1c308f97b377fe4
    ? ./setPipelineStep.dhall
, setPipelineStepWithHooks =
      ./setPipelineStepWithHooks.dhall sha256:b2766b447007bf7c69967f14f3a1946c3083de93265f6354085a8107a087ce0f
    ? ./setPipelineStepWithHooks.dhall
, aggregateStep =
      ./aggregateStep.dhall sha256:e178cada70176915b7d89d162bbff4c63937d567d79f3c5d12200fe83b269fee
    ? ./aggregateStep.dhall
, inParallelStep =
      ./inParallelStep.dhall sha256:f42f48c653f2d240991c720adb03e4cfe12fd051faac1dd6db89b62676a81da6
    ? ./inParallelStep.dhall
, inParallelStepSimple =
      ./inParallelStepSimple.dhall sha256:3c3d135f9827d3c6e6e9ffca5fe00a7116a94923918e6d46a5d360bb639189a6
    ? ./inParallelStepSimple.dhall
, doStep =
      ./doStep.dhall sha256:b83a91eee187dcb2c2ea7e67d2c0cb9b64751795867d2aebbc5379de58a4b780
    ? ./doStep.dhall
, tryStep =
      ./tryStep.dhall sha256:5ec31d38f1b733434a36fcef4b3db74f058a25bb5cacd50af586972725affda5
    ? ./tryStep.dhall
, getWithHooks =
      ./getWithHooks.dhall sha256:5b0b89f2547062d806be0fb6a03b2c2bc97dba49bfefb07114bb145f863b16c5
    ? ./getWithHooks.dhall
, putWithHooks =
      ./putWithHooks.dhall sha256:8fcaf729d5d167c8444847f88769270542de17bea44e3652963c7026284e4a13
    ? ./putWithHooks.dhall
, taskWithHooks =
      ./taskWithHooks.dhall sha256:307372b73045553672a32853eb71cc3dbe539c194c0f8423f588e33686d9bf48
    ? ./taskWithHooks.dhall
, inParallelWithHooks =
      ./inParallelWithHooks.dhall sha256:e5daa90b3818ce3ae7f100118f26cc85d0d5379c8021939f7fc900aed203223e
    ? ./inParallelWithHooks.dhall
, aggregateWithHooks =
      ./aggregateWithHooks.dhall sha256:9453f2e55a7e3d3a0540e9ff8696c1a6b679428345465eb71b6f3c31e128d256
    ? ./aggregateWithHooks.dhall
, doWithHooks =
      ./doWithHooks.dhall sha256:edb4eb1e29c98106a98fe347a9c0452f9df85f056c991ac2a488a738925fb41b
    ? ./doWithHooks.dhall
, tryWithHooks =
      ./tryWithHooks.dhall sha256:cbc3037f80665b70f2e64d69104d5d9a514ac871d9b980d322086c5a682e41e7
    ? ./tryWithHooks.dhall
, addTags =
      ./addTags.dhall sha256:7d7dcb01bdc6b5b06df2aba664a48dfbca67956a06bab532a52791b7054081a4
    ? ./addTags.dhall
}
