local is_neovide = vim.g.neovide or false
return {
  {
    {
      "3rd/image.nvim",
      enabled = false,
    },
    {
      "folke/flash.nvim",
      enabled = false,
      -- enabled = is_neovide used to enable it only in neovide
    },
  },
}
