return {
  "hedyhli/markdown-toc.nvim",
  enabled = false,
  ft = "markdown", -- Lazy load on markdown filetype
  -- cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
  opts = {
    headings = {
      -- Include headings before the ToC (or current line for `:Mtoc insert`).
      -- Setting to true will include headings that are defined before the ToC
      -- position to be included in the ToC.
      before_toc = false,
    },
    auto_update = false,
    fences = {
      enabled = false,
      -- These fence texts are wrapped within "<!-- % -->", where the '%' is
      -- substituted with the text.
      start_text = "",
      end_text = "",
      -- An empty line is inserted on top and below the ToC list before the being
      -- wrapped with the fence texts, same as vim-markdown-toc.
    },
  },
}
