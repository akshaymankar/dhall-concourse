{ Types =
      ./types/package.dhall sha256:e6da66b9a0e96374111766d4173e0ee950d58a8dcce32528d6274e67690a7272
    ? ./types/package.dhall
, defaults =
      ./defaults/package.dhall sha256:f4c452862b18fac1fbeac362d7300c5b67d96180be9fea6bd7af01ad575b508d
    ? ./defaults/package.dhall
, schemas =
      ./schemas/package.dhall sha256:1e6a6c263d58a0c76d4507054fa5458ee2b8dcd2936b037393e6410458e2d4e8
    ? ./schemas/package.dhall
, helpers =
      ./helpers/package.dhall sha256:c213187cd2f23498f63fe020b59dcced1c83e9951b68974eef6821b0ce6da0fb
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:1d3ce4dfa07be4f099265439d7c40f7f77bc5b8c1e7172774ecf61968e8eae80
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:f3b84a4f8fb65ee5cb0fae445cf9b56335b42023b3358f37fe7cee1629c86b39
    ? ./extractors/package.dhall
}
