return {
  {
    -- enabled = false,
    "zaldih/themery.nvim",
    config = function(_, opts)
      require("themery").setup({
        themes = {
          "gruvbox",
          "ayu",
          "rose-pine",
          "catppuccin",
          "tokyonight",
          "tokyonight-night",
          "tokyonight-moon",
          "onedark_dark",
          "onedark_vivid",
          "nordic",
          "solarized-osaka",
          "dracula",
          "synthweave",
          "miasma",
          "oxocarbon",
          "komau",
          "darkrose",
          "omni",
        }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end,
  },
}