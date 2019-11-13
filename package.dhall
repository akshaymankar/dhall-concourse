{ Types =
      ./types/package.dhall sha256:86f475219ce8e4e404223e38adc1d6be83bbbe201e92e2b19f942a13f8ca1a08
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:4d6d8ccaac5be640ce38b1d0e613469b4f26720675787823551f3937fbe5bde0
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:d23b74fafc5d0d3dd35e6f869f7d3793017dcb07c4264b9082c8302750b1cb81
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
