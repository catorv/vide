return {
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      {
        "gS",
        function()
          require("treesj").split()
        end,
        desc = "Split node under cursor",
      },
      {
        "gJ",
        function()
          require("treesj").join()
        end,
        desc = "Join node under cursor",
      },
    },
  },
}
