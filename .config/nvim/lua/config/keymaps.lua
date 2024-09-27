local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- my keymaps
keymap.set("n", "--", vim.cmd.Oil)
keymap.set("n", "tt", vim.cmd.Themery)
-- keymap.set("n", "gs", vim.cmd.LiveServerStart)
-- keymap.set("n", "gq", vim.cmd.LiveServerStop)

-- Select all
keymap.set("n", "aa", "gg<S-v>G")

-- keep window centered when going up/down
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
-- keymap.set("n", "s", "")
keymap.set("i", "jj", "<esc>")
keymap.set("n", "gf", "<C-W>gf")
-- keymap.set("x", "<leader>p", '"_dp')

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- code-runner
keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rff", ":RunFile<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>raa", ":CRFiletype<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rab", ":CRProjects<CR>", { noremap = true, silent = false })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "qq", vim.cmd.q)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "<c-k>", "<C-w>k")
keymap.set("n", "c-j>", "<C-w>j")
keymap.set("n", "c-h>", "<C-w>h")
keymap.set("n", "<c-l>", "<C-w>l")

-- Resize window
-- keymap.set("n", "<C-w><right>", "<C-w><")
-- keymap.set("n", "<C-w><left>", "<C-w>>")
-- keymap.set("n", "<C-w><down>", "<C-w>+")
-- keymap.set("n", "<C-w><up>", "<C-w>-")

keymap.set("n", "<C-w><l>", "<C-w><")
keymap.set("n", "<C-w><h>", "<C-w>>")
keymap.set("n", "<C-w><j>", "<C-w>+")
keymap.set("n", "<C-w><k>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<A-d>", function()
  vim.diagnostic.goto_next()
end, opts)

-- keymap.set("n", "<leader>r", function()
--   require("craftzdog.hsl").replaceHexWithHSL()
-- end)
--
-- keymap.set("n", "<leader>i", function()
--   require("craftzdog.lsp").toggleInlayHints()
-- end)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- obsidian  keymaps
keymap.set(
  "n",
  "<leader>fo",
  ':Telescope find_files search_dirs={"/media/Docs/notes/Zet"}<cr>',
  { desc = "search notes" }
)
keymap.set(
  "n",
  "<leader>og",
  ':Telescope live_grep search_dirs={"/media/Docs/notes"}<cr>',
  { desc = "live grep in notes" }
)
keymap.set("n", "<leader>o", "", { desc = "+obsidian" })
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
keymap.set("n", "<leader>ot", vim.cmd.ObsidianNewFromTemplate, { desc = "New Note with template" })
keymap.set("n", "<leader>od", vim.cmd.ObsidianDailies, { desc = "New Daily Note" })
keymap.set("n", "<leader>oq", vim.cmd.ObsidianQuickSwitch, { desc = "Notes QuickSwitch" })
keymap.set("n", "<leader>oh", vim.cmd.ObsidianTags, { desc = "Search Tags" })
keymap.set("n", "<leader>oc", vim.cmd.ObsidianTOC, { desc = "Search TOC" })
-- keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "Note Extract" })
keymap.set("v", "<leader>oe", ":ObsidianExtractNote<cr>", { desc = "Note Extract" })

keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
