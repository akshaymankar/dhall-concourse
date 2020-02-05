{ Types =
      ./types/package.dhall sha256:4576b3998000a9e15b5e569913a36dcdee8607470d94e6b37f6d12e725588e51
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:f4cc4d0a87f5a474de645f4ec8320aa055fa391d2a97696acba2814b8f594eb8
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:6a1466287aa08d3911f9b07357079dfb58740747d66510367ad17290be695e6f
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:080889a3227bb0edd8d97dadff81da61e3852be82aad889487ba664a8732e87b
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:380eab61bcc75473589242aa13011d0912f0634745f84c185296594c557bacb7
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:761aabbb030ca0fca473273e7c8b45c29dcd848388bdb767db7322a1243a5dd6
    ? ./extractors/package.dhall
}
