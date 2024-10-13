return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  config = function()
    require("sniprun").setup({
      live_mode_toggle = "enable",
    })
  end,
}
