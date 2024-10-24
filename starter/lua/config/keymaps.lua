-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set

map("i", "jk", "<ESC>", { silent = true })

map({ "i", "v", "n" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "v", "n" }, "<A-q>", "<cmd>qa<cr>", { desc = "Quit All" })

map({ "i", "c" }, "<C-a>", "<Home>", { desc = "Start of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

map("n", "<S-Left>", "20zh", { desc = "Quick Move Left" })
map("n", "<S-Right>", "20zl", { desc = "Quick Move Right" })
map("n", "<S-Down>", "6<C-e>", { desc = "Quick Move Down" })
map("n", "<S-Up>", "6<C-y>", { desc = "Quick Move Up" })

local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
map("n", "<F12>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<F12>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<F3>", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<F4>", require("goto-preview").goto_preview_definition, { desc = "Preview definition" })
map({ "n", "v" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })

map("n", "<A-c>", "<cmd>normal gcc<CR>", { desc = "Toggle comment line" })
map("v", "<A-c>", "<cmd>normal gc<CR>", { desc = "Toggle comment line" })

map({ "n", "v" }, "=0", function()
  Util.format({ force = true })
end, { desc = "Format" })
