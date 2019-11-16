{ Types =
      ./types/package.dhall sha256:86f475219ce8e4e404223e38adc1d6be83bbbe201e92e2b19f942a13f8ca1a08
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:f4cc4d0a87f5a474de645f4ec8320aa055fa391d2a97696acba2814b8f594eb8
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:6a1466287aa08d3911f9b07357079dfb58740747d66510367ad17290be695e6f
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
