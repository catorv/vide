-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set

map("i", "jk", "<ESC>", { silent = true })

map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

map({ "i", "c" }, "<C-a>", "<Home>", { desc = "Start of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

map("n", "<S-Left>", "20zh")
map("n", "<S-Right>", "20zl")
map("n", "<S-Down>", "6<C-e>")
map("n", "<S-Up>", "6<C-y>")

local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
map("n", "<F12>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<F12>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("n", "<f2>", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<f4>", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "Code Action" })
map("n", "<leader>;", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map({ "n", "v" }, "=0", function()
  Util.format({ force = true })
end, { desc = "Format" })
