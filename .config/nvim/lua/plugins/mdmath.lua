return {
  "Thiago4532/mdmath.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Filetypes that the plugin will be enabled by default.
    filetypes = { "markdown" },
    -- Color of the equation, can be a highlight group or a hex color.
    -- Examples: 'Normal', '#ff0000'
    foreground = "Normal",
    -- Hide the text when the equation is under the cursor.
    anticonceal = true,
    -- Hide the text when in the Insert Mode.
    hide_on_insert = true,
    -- Scale of the equation images, increase to prevent blurry images when increasing terminal
    -- font, high values may produce aliased images.
    scale = 1.0,
  },
}
