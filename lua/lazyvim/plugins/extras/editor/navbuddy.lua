return {
  {
    "SmiteshP/nvim-navbuddy",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return {
        window = {
          border = "rounded",
          sections = {
            left = {
              size = "20%",
            },
            mid = {
              size = "30%",
            },
            right = {
              preview = "always",
            },
          },
        },
        node_markers = {
          enabled = true,
          icons = {
            leaf = "  ",
            leaf_selected = " ",
            branch = " ",
          },
        },
        lsp = { auto_attach = true },
        icons = require("lazyvim.config").icons.kinds,
      }
    end,
    keys = {
      {
        "<leader>cs",
        function()
          require("nvim-navbuddy").open()
        end,
        desc = "Goto Symbol",
      },
      {
        "<C-p>",
        function()
          require("nvim-navbuddy").open()
        end,
        desc = "Goto Symbol",
      },
    },
  },
}
