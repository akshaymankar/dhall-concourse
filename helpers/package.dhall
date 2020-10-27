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
      ./setPipelineStepWithHooks.dhall sha256:9b2b09625a8d8a4d979f6e137d52f859fd35f0fae003a6b2ba63aa8ac8069571
    ? ./setPipelineStepWithHooks.dhall
, loadVarStep =
      ./loadVarStep.dhall sha256:cf17f2673910039b420f46eee825e5e3306dfaa169fd83152141f9dd259f6ea9
    ? ./loadVarStep.dhall
, loadVarStepWithHooks =
      ./loadVarStepWithHooks.dhall sha256:0256f61fff8b513aef2b4bfe1dedb969f05fb69a12ea4dc9377e0b5fb691981f
    ? ./loadVarStepWithHooks.dhall
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
      ./getWithHooks.dhall sha256:1025d97ace624d3598f674c808223cd7529315e8878e17fd71d1ef3f77e60d51
    ? ./getWithHooks.dhall
, putWithHooks =
      ./putWithHooks.dhall sha256:d030743ef13614bd0d306c594972de0b161ca13422bec161a2ecc382b67a999b
    ? ./putWithHooks.dhall
, taskWithHooks =
      ./taskWithHooks.dhall sha256:929aa455078af8f0a4223d2b56a843a12319f0c4cfc862b71b24bb1e15b47fcc
    ? ./taskWithHooks.dhall
, inParallelWithHooks =
      ./inParallelWithHooks.dhall sha256:776df2cfcc2e490da3207101aeec0d61004806ea79a399b80f297f2c11029cc2
    ? ./inParallelWithHooks.dhall
, aggregateWithHooks =
      ./aggregateWithHooks.dhall sha256:35587656d841a10eab6ab0b5d6306be3115a13e43e065d7d468f5f1609e904de
    ? ./aggregateWithHooks.dhall
, doWithHooks =
      ./doWithHooks.dhall sha256:193e7c34a9efba9d0b647469c193ceb4c57a08e8a9117a8e998f78747b14023b
    ? ./doWithHooks.dhall
, tryWithHooks =
      ./tryWithHooks.dhall sha256:ef71fc27e04eacf1fbcb3d8f5a014881c07e236ae59f71c4bf1bb4bfd9d2f4a7
    ? ./tryWithHooks.dhall
, addTags =
      ./addTags.dhall sha256:4ab781e4a817a2e44113e9909f0d0cd2584594e1d0e12c7cc73fcd6df540db09
    ? ./addTags.dhall
, addTagsToStepsOnly =
      ./addTagsToStepsOnly.dhall sha256:fe9b8a7f6cfbad97af4be5e3a0c90d042a7448c43b6de56b72fbf4b1992deb11
    ? ./addTagsToStepsOnly.dhall
, addHooks =
      ./addHooks.dhall sha256:3b57b57d9dd32b2ee80942e77ec24814fe9babc850012148c79fb9e613d89966
    ? ./addHooks.dhall
}
