{ Types =
      ./types/package.dhall sha256:35d21e500af502817cf25857447ac8e847261b76055f2c23b43f76a6a953db0c
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:15e958705784a9fcb3c7637dac50ccf74be318db1ffc771af4d7ee9b5a3f2906
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:bf3838a202e3d5d7f5b764229b069423ec54d2c6a8ea1658a1036ad855750bbd
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:334d50f7b6248b79c2d9c944d49dd60cb5ccd6e2812f42a83d4282eb6cf9a299
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:102ffaeffabf83db684c6c1ee9c30023ad080aea4a776328f6fd7d3a8d4b1309
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:3113ce1ed76db6bcf9659492a578df9fda84d50054918046cce7991d59f99de0
    ? ./extractors/package.dhall
}
