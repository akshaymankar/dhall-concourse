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
      ./helpers/package.dhall sha256:b80e9ffaa67fc1474e8749ce99037ebac2f8d61d5ddbad9aa74fe8ccd2e6b4a9
    ? ./helpers/package.dhall
, render =
      ./render/package.dhall sha256:ac54030d28d5eb754be9e944ff0a372de62d2422e33624ccd486dc535085e96e
    ? ./render/package.dhall
, extractors =
      ./extractors/package.dhall sha256:67c2c05a104708900547969798d6a81d319903f70a04812149ec6ad3682f6f5b
    ? ./extractors/package.dhall
}
