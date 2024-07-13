local Util = require("lazyvim.util")

return {
  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    opts = {
      height = 50,
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
      -- border = { "█", "█", "█", "▐", "▟", "▄", "▙", "▌" },
      -- border = "rounded",
      -- border = { "█", "█", "█", "▕", "▔", "▔", "▔", "▏" },
      border = { "", " ", "", "", "", "", "", "" },
      -- opacity = 10,
      default_mappings = true,
      preview_window_title = { enable = true, position = "center" },
      post_open_hook = function(bufnr, winnr)
        -- print("***_**")
        vim.keymap.set({ "n", "i", "v" }, "<C-c>", "<C-w>c", { silent = true, buffer = bufnr })

        if Util.has("zen-mode.nvim") then
          vim.keymap.set("n", "gz", function()
            require("zen-mode").toggle()
            require("goto-preview").dismiss_preview(winnr)
            vim.keymap.del("n", "<C-c>", { silent = true, buffer = bufnr })
            vim.keymap.del("n", "gz", { silent = true, buffer = bufnr })
          end, { silent = true, buffer = bufnr })
        end
      end,
      -- post_close_hook = function(bufnr)
      --   vim.keymap.del("n", "<C-c>", { silent = true, buffer = bufnr })
      --   if Util.has("zen-mode.nvim") then
      --     vim.keymap.del("n", "gz", { silent = true, buffer = bufnr })
      --   end
      -- end,
    },
  },
}
