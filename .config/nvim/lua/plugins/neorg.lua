return {
  {
    enabled = false,
    "nvim-neorg/neorg",
    lazy = false,
    -- ft = "norg",
    version = "*",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = { icon_preset = "diamond" },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "/media/Docs/",
            },
            default_workspace = "notes",
          },
        },
      },
    },
  },
}
