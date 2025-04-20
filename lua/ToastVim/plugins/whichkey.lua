return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f",  group = "Find"},
      { "<leader>s",  group = "Search", },
      { "<leader>g",  group = "Git", icon = {icon = ""} },
      { "<leader>u",  group = "Ui", },
      { "<leader>c",  group = "Code", },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
  keys = {
    { "<leader>?", "<CMD>WhichKey<CR>", desc = "WhichKey", },
  },
}
