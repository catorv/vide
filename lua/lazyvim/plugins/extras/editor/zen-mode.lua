return {

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      window = {
        width = 130,
      },
      plugins = {
        gitsigns = { enabled = false },
      },
    },
    keys = {
      {
        "gz",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Zne Mode",
      },
    },
  },
}
