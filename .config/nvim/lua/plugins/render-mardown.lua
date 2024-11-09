return {
  {
    -- enabled = false,
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        enabled = true,
        sign = true,
        width = "block",
        right_pad = 10,
        left_pad = 3,
        language_pad = 1,
      },
      heading = {
        sign = true,
        signs = { "󰫎 " },
        -- icons = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳" },
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- icons = { "", "", "", "", "", "" },
        position = "overlay",
        width = "full",
        -- border = true,
        border_prefix = true,
      },
      latex = {
        enabled = false,
        converter = "latex2text",
        highlight = "RenderMarkdownMath",
        top_pad = 0,
        bottom_pad = 0,
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    --   config = function(_, opts)
    --     require("render-markdown").setup(opts)
    --     LazyVim.toggle.map("<leader>um", {
    --       name = "Render Markdown",
    --       get = function()
    --         return require("render-markdown.state").enabled
    --       end,
    --       set = function(enabled)
    --         local m = require("render-markdown")
    --         if enabled then
    --           m.enable()
    --         else
    --           m.disable()
    --         end
    --       end,
    --     })
    --   end,
    -- },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>um")
    end,
  },
}
