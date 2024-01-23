-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set

map("i", "jk", "<ESC>", { silent = true })

map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")

local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
map("n", "<F12>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<F12>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("n", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })

map({ "n", "v" }, "=0", function()
  Util.format({ force = true })
end, { desc = "Format" })
