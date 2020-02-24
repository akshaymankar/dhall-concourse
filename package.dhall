{ Types =
      ./types/package.dhall sha256:c9a1dca64d70a28b126825f3c049c3c7ce5b62de6944d1eea819bce5cdafa545
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:39713773aa3d6eccedfef9e30e3cb8692dbe79b48ebbbd4356715e4a8f388754
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:565be3e3f8c6edbe9918664f59720ea3efe64dcb89f62cebb413992386b195bd
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:35a321e7b48d31bab3413a29b48b1a730502854e3c63bda8985fae3adb3300f6
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:a6e12d4c86b383901a5eb644f3775d26c107fdba02c4109f0d76089bb96b3af5
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:2d2d6d2320996d4f925e6166b8ccda65698f44cafe46fbb76b7fee1655fa7085
    ? ./extractors/package.dhall
}
