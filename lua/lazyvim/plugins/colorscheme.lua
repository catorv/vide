return {
  --
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      italic = {
        strings = false,
      },
      overrides = {
        ColorColumn = { bg = "#2E2E2E" },
        -- IblIndent = { fg = "#2E2E2E" },
        IblIndent = { fg = "#404040" },
        MiniIndentscopeSymbol = { fg = "#666666" },
        NeoTreeNormal = { fg = "#ebdbb2", bg = "#2C2825" },
        NeoTreeNormalNC = { fg = "#ebdbb2", bg = "#2C2825" },
        NeoTreeCursorLine = { bg = "#0C0F10" },
        BufferLineBufferVisible = { fg = "#d5c4a1", bg = "#242424" },
        BufferLineHintVisible = { fg = "#d5c4a1", bg = "#242424" },
        BufferLineInfoVisible = { fg = "#d5c4a1", bg = "#242424" },
        BufferLineWarningVisible = { fg = "#d5c4a1", bg = "#242424" },
        BufferLineErrorVisible = { fg = "#d5c4a1", bg = "#242424" },
        BufferLineTabSelected = { fg = "#fabd2f", bg = "#242424" },
      },
    },
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}
