local is_neovide = vim.g.neovide or false
return {
  {
    {
      "3rd/image.nvim",
      enabled = not is_neovide,
    },
    {
      "folke/flash.nvim",
      enabled = true,
      -- enabled = is_neovide used to enable it only in neovide
    },
  },
}
