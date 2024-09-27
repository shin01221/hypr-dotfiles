return {
  ft = { "markdown" },
  enabled = false,
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("headlines").setup({
      markdown = {
        fat_headlines = false,
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
        bullets = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳" },
        codeblock_highlight = "disable",
        -- bullets = { "󰎤", "󰎧", "󰎪", "󰎮", "󰎰", "󰎵" },
        -- bullets = { "◉", "○", "✸", "✿" },
      },
    })
  end,
}
