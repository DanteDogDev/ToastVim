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
      { "<leader>x", group = "Quickfix", icon = { icon = "󱖫 ", color = "green" } },
      { "<leader>b", group = "Buffer", },
      { "<leader>q", group = "Session", },
      { "z", group = "fold" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
  keys = {
    { "<leader>?", "<CMD>WhichKey<CR>", desc = "WhichKey" },
  },
}
