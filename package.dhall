{ Types =
      ./types/package.dhall sha256:e6da66b9a0e96374111766d4173e0ee950d58a8dcce32528d6274e67690a7272
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:f4c452862b18fac1fbeac362d7300c5b67d96180be9fea6bd7af01ad575b508d
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:b179184e3bbdeb70815b1da9f493ec1f6e3a71c6f1f82fea6fd5672cc37bfe32
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:8b7c43d24c0d1c1b7c0c7c933d066c878593e82047fb0663c6fa27a30e1e4766
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:1d3ce4dfa07be4f099265439d7c40f7f77bc5b8c1e7172774ecf61968e8eae80
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:f3b84a4f8fb65ee5cb0fae445cf9b56335b42023b3358f37fe7cee1629c86b39
    ? ./extractors/package.dhall
}
