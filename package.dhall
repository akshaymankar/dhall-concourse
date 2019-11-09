{ Types =
      ./types/package.dhall sha256:86f475219ce8e4e404223e38adc1d6be83bbbe201e92e2b19f942a13f8ca1a08
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:476f2dce7f8e04cce353dd2b3e78db443350ba2d162597e1c49e968aa7c39db5
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:3e33020416b40b54cb4729abcaf2b887ba88e44283886746d9043fc50a2e7dc3
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:94d9aab795fe7049da8c7904d6faa7c7be60ed10a59565c33d7cf9d026a6968d
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:b10f699b4b7506f916957d6c2103452b25fc13690c8c5352d327e89962a15e2d
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:761aabbb030ca0fca473273e7c8b45c29dcd848388bdb767db7322a1243a5dd6
    ? ./extractors/package.dhall
}
