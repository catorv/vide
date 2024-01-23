return {
  {
    "danymat/neogen",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    keys = {
      {
        "<leader>cg",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate Document Comment",
      },
    },
  },
}
