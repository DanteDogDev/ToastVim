return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>?", group = "WhichKey", icon = { icon = "" } },
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Search" },
      { "<leader>g", group = "Git", icon = { icon = "" } },
      { "<leader>u", group = "Ui" },
      { "<leader>c", group = "Code" },
      { "<leader>x", group = "quickfix", icon = { icon = "󱖫 ", color = "green" } },
      { "<leader>b", group = "buffer", },
      { "z", group = "fold" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
  keys = {
    { "<leader>?", "<CMD>WhichKey<CR>", desc = "WhichKey" },
  },
}
