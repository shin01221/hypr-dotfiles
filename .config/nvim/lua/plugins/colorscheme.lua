return {
  {
    "ellisonleao/gruvbox.nvim",
  },
  { "catppuccin/nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "samharju/synthweave.nvim",
  },
  {
    "ayu-theme/ayu-vim",
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "ntk148v/komau.vim",
  },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "getomni/neovim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "synthweave",
    },
  },
}
