{ taskStep =
      ./taskStep.dhall sha256:70d9bca82912ffc2d670952657d8f54f5090ab7a1b3d87f136104bee11537359
    ? ./taskStep.dhall
, putStep =
      ./putStep.dhall sha256:36cf1f3065db932e5cd52bc564b9ce0a4236a6713277dacb11119d497ff77196
    ? ./putStep.dhall
, getStep =
      ./getStep.dhall sha256:7fa4a6cc1b49f64d6420d1ba0de9cfac09f0f78fac782644043d99d59ad00ed1
    ? ./getStep.dhall
, aggregateStep =
      ./aggregateStep.dhall sha256:4c63bc1b4c97b7a7496644ac35a848bce4673ae929ac7bce016d269a1df1d61c
    ? ./aggregateStep.dhall
, inParallelStep =
      ./inParallelStep.dhall sha256:16810a83749f2373df22b263004c7f462bbe744089cdba5749e241555339e2ec
    ? ./inParallelStep.dhall
, inParallelStepSimple =
      ./inParallelStepSimple.dhall sha256:70d3023fb015584b5ed0d439e0a0aaa8cef6802733d85256cf571a8fbd5da8fd
    ? ./inParallelStepSimple.dhall
, doStep =
      ./doStep.dhall sha256:8db65241db7e62a1eb2ba241c61491ca964f438dfc74708f696ec2475fb65b08
    ? ./doStep.dhall
, tryStep =
      ./tryStep.dhall sha256:54675d2eef37e557d8208d86dd76162b9fd7d97e7c24b7f249ca20e9b39319eb
    ? ./tryStep.dhall
, getWithHooks =
      ./getWithHooks.dhall sha256:955df86d3c2e47cc8ad716753daa601ab480e517ef95d5cc254e81bff26830f4
    ? ./getWithHooks.dhall
, putWithHooks =
      ./putWithHooks.dhall sha256:f371b5557998a9c6c8cc62931e5ed0f71f47e2446c61a66e06911d1c5b2890b5
    ? ./putWithHooks.dhall
, taskWithHooks =
      ./taskWithHooks.dhall sha256:315fee6fb1194a7e9d65046f6c9b411b50ba5cc4648ce4ae83a90907aaac7b61
    ? ./taskWithHooks.dhall
, inParallelWithHooks =
      ./inParallelWithHooks.dhall sha256:165993bc29b1e5f1aa9b9be629b5ce443626cc1a481ff1af3a301ed492da0180
    ? ./inParallelWithHooks.dhall
, aggregateWithHooks =
      ./aggregateWithHooks.dhall sha256:d1aa9c681ad69025596b888acc95ce81d1c5599de38441190499a19420e842a2
    ? ./aggregateWithHooks.dhall
, doWithHooks =
      ./doWithHooks.dhall sha256:540a12579021f3b597f34d7929f4e9686d66274ad542173e8334a2236b748e7c
    ? ./doWithHooks.dhall
, tryWithHooks =
      ./tryWithHooks.dhall sha256:b1808275879f924e73fd9c12393f04a9563c8f1a74743f5ac125d9849b912b0d
    ? ./tryWithHooks.dhall
}
