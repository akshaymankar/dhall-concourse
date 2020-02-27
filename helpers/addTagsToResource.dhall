  λ(tags : List Text)
→ λ(r : ../types/Resource.dhall)
→   r
  ⫽ { tags =
        merge
          { None = Some tags, Some = λ(ts : List Text) → Some (ts # tags) }
          r.tags
    }
