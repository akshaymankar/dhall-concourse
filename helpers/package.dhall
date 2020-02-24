{ taskStep =
      ./taskStep.dhall sha256:35f1f101a0e28a192330aadc36105db3f4e4de4a2376dcdc906ce66ede466027
    ? ./taskStep.dhall
, putStep =
      ./putStep.dhall sha256:0bdc86fff43404a8bd70f7f1b0a1a1c06ef06cc8cc6564b091eb94f62efd985b
    ? ./putStep.dhall
, getStep =
      ./getStep.dhall sha256:44a9ad8aeddca12f390148e76d649e29607d1160e1984440a008e923b6e7cb1e
    ? ./getStep.dhall
, setPipelineStep =
      ./setPipelineStep.dhall sha256:d88e17fb0603e3464672ee22225828e5be3728955b57f9ce363fa32b39712e99
    ? ./setPipelineStep.dhall
, setPipelineStepWithHooks =
      ./setPipelineStepWithHooks.dhall sha256:042f8840304647a3041d03b116468248256a43867b81d1f5653814f725b69caa
    ? ./setPipelineStepWithHooks.dhall
, aggregateStep =
      ./aggregateStep.dhall sha256:66bd981b354edb0491ad2563392b75f943778ad4cffa0de49d7dac0f351b6137
    ? ./aggregateStep.dhall
, inParallelStep =
      ./inParallelStep.dhall sha256:0d99e7f5466a08ea64980b150c99f63c65c09b22e4a859a4eff95ec0f86f459e
    ? ./inParallelStep.dhall
, inParallelStepSimple =
      ./inParallelStepSimple.dhall sha256:3dd28a9566544d59482cdd9a8d29fa2617c47eab30f2027d90a966582340f266
    ? ./inParallelStepSimple.dhall
, doStep =
      ./doStep.dhall sha256:6939459a1703b9173c0cad95ab4f2c7e6b1c08856c74e16d70d4ac21be90d225
    ? ./doStep.dhall
, tryStep =
      ./tryStep.dhall sha256:3ff6d62d5444b1b0d8e0625cdf6ab784b8771e682d32615981fc50187c8d07d8
    ? ./tryStep.dhall
, getWithHooks =
      ./getWithHooks.dhall sha256:814a97dd8f2a1b235cb78e5da23cde349d43c4c31e7685d6a186c1aff580f6fa
    ? ./getWithHooks.dhall
, putWithHooks =
      ./putWithHooks.dhall sha256:8d495a462244021cdab012cb09787a91a414b55a8b5c0ad064cacd5d0bdca1f1
    ? ./putWithHooks.dhall
, taskWithHooks =
      ./taskWithHooks.dhall sha256:e7147cb3d5e60ac0354c72b787305517bec0f839b0fea98173bac08da4c2f541
    ? ./taskWithHooks.dhall
, inParallelWithHooks =
      ./inParallelWithHooks.dhall sha256:6c1dddcbdf64f8a8bfd002a56ebba422b5be5c2922099e5a297dd25b4bb54fb6
    ? ./inParallelWithHooks.dhall
, aggregateWithHooks =
      ./aggregateWithHooks.dhall sha256:8b11ec6d240005c4707cc6920539731b4788a6dcf717d3f9679da3c8c93581ae
    ? ./aggregateWithHooks.dhall
, doWithHooks =
      ./doWithHooks.dhall sha256:aa0aabe9c774a7f875f2b7f86ba732719b13c0ea00a7637a82b1e76526aa3c6a
    ? ./doWithHooks.dhall
, tryWithHooks =
      ./tryWithHooks.dhall sha256:bbec9d446615e592d83a5f9340ebad2ac289bfcab56fa95338c7e45662a42f5d
    ? ./tryWithHooks.dhall
, addTags =
      ./addTags.dhall sha256:99644b3b9ba67a6febd9c5038cd3f0b19265ba95f6211569e941fc890db6ab95
    ? ./addTags.dhall
}
