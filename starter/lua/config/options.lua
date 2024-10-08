-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.backup = false
opt.writebackup = false
opt.swapfile = false
-- opt.signcolumn = "yes:1" -- Always show the signcolumn, otherwise it would shift the text each time

opt.colorcolumn = { 80, 100 }
