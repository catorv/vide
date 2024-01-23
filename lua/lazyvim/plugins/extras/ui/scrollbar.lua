return {
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {
      handlers = {
        cursor = false,
      },
      marks = {
        Search = { text = { "⠐", "⠰", "⠸", "⢸" } },
        Error = { text = { "⠐", "⠰", "⠸", "⢸" } },
        Warn = { text = { "⠐", "⠰", "⠸", "⢸" } },
        Info = { text = { "⠐", "⠰", "⠸", "⢸" } },
        Hint = { text = { "⠐", "⠰", "⠸", "⢸" } },
        Misc = { text = { "⠐", "⠰", "⠸", "⢸" } },
      },
      excluded_filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
    config = function(_, opts)
      require("scrollbar").setup(opts)
    end,
  },
}
