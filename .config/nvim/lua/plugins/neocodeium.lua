return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    require("neocodeium").setup({
      filetypes = {
        TelescopePrompt = false,
        ["dap-repl"] = false,
      },
    })

    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-e>", neocodeium.cycle)
  end,
}
