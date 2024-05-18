-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("vide")

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h10"
  vim.o.linespace = 0
  vim.o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff350-blinkon650-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_transparency = 0.95

  vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    -- fold = "⸱",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
    -- horiz = "─",
    -- horizup = "─",
    -- horizdown = "─",
    -- vert = "▏",
    -- vertleft = "▏",
    -- vertright = "▏",
    -- verthoriz = "▏",
  }

  -- Allow clipboard copy paste in neovim
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
