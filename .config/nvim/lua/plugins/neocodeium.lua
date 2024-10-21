return {
  "monkoose/neocodeium",
  -- enabled = false,
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
    vim.keymap.set("i", "<A-f>", function()
      require("neocodeium").accept()
    end)
    vim.keymap.set("i", "<A-e>", function()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept_word()
    end)
    vim.keymap.set("i", "<A-l>", function()
      require("neocodeium").accept_line()
    end)
  end,
}
