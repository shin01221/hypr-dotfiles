vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.vim_markdown_frontmatter = 1
vim.g.mapleader = " "
vim.g.virtualedit = "block"
vim.opt.spell = false
vim.opt.conceallevel = 1
vim.opt.concealcursor = "nc"
vim.opt.undofile = true
vim.g.maplocalleader = ","
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 999
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- vim.cmd.set("arabic")
vim.cmd.set("termbidi")
-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end
vim.wo.foldlevel = 99

-- neovide configs

if vim.g.neovide then
  vim.o.guifont = "Maple Mono:h10"
  vim.g.neovide_padding_top = 30
  vim.g.neovide_padding_right = 20
  vim.g.neovide_padding_left = 20
end