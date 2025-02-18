return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Enable the image module
    statuscolumn = { enabled = true },
    input = { enabled = true },
    bigfile = { enabled = true },
    image = {
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        "mp4",
        "mov",
        "avi",
        "mkv",
        "webm",
        "pdf",
      },
      img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
      styles = {
        relative = "editor",
        border = "rounded",
        focusable = false,
        backdrop = false,
        row = 1,
        col = 1,
      },
      -- Configuration options for the image module
      force = false, -- Display images only if the terminal supports it
      doc = {
        enabled = true,
        inline = false,
        float = true,
      },
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
        spell = false,
        statuscolumn = "",
      },
    },
  },
}
