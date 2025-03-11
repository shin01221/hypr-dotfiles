return {
  {
    lazy = true,
    "ellisonleao/gruvbox.nvim",
  },
  {
    lazy = true,
    "catppuccin/nvim",
  },
  {
    lazy = true,
    "rose-pine/neovim",
    name = "rose-pine",
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "neanias/everforest-nvim",
    -- enabled = false,
    version = true,
    lazy = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    priority = 1000, -- Ensure it loads first
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = false,
      }
    end,
  },
  {
    "binhtran432k/dracula.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "samharju/synthweave.nvim",
    lazy = true,
  },
  {
    "ayu-theme/ayu-vim",
    lazy = true,
  },
  {
    "xero/miasma.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },
  {
    "ntk148v/komau.vim",
    lazy = true,
  },
  {
    "water-sucks/darkrose.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "getomni/neovim",
    lazy = true,
  },
}
