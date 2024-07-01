return {
  {
    -- highlighting for chezmoi files template files
    "alker0/chezmoi.vim",
    init = function()
      vim.g["chezmoi#use_tmp_buffer"] = 1
      vim.g["chezmoi#source_dir_path"] = os.getenv("HOME") .. "/.local/share/chezmoi"
    end,
  },
  {
    "xvzc/chezmoi.nvim",
    keys = {
      {
        "<leader>sz",
        function()
          require("telescope").extensions.chezmoi.find_files()
        end,
        desc = "Chezmoi",
      },
    },
    opts = {
      edit = {
        watch = false,
        force = false,
      },
      notification = {
        on_open = true,
        on_apply = true,
        on_watch = false,
      },
      telescope = {
        select = { "<CR>" },
      },
    },
    init = function()
      -- run chezmoi edit on file enter
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function()
          vim.schedule(require("chezmoi.commands.__edit").watch)
        end,
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local projects = {
        action = "Telescope chezmoi find_files",
        desc = "  Config",
        icon = "",
        key = "c",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      -- remove lazyvim config property
      for i = #opts.config.center, 1, -1 do
        if opts.config.center[i].key == "c" then
          table.remove(opts.config.center, i)
        end
      end

      table.insert(opts.config.center, 5, projects)
    end,
  },
}
