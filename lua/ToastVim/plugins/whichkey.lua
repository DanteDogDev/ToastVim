return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
  },
  keys = {
    { "<leader>?", "<CMD>WhichKey<CR>", desc = "WhichKey", },
    { "<leader>f", "", desc = "Find", },
    { "<leader>s", "", desc = "Search", },
    { "<leader>g", "", desc = "Git", },
    { "<leader>u", "", desc = "Ui", },
    { "<leader>c", "", desc = "Code", },
  },
}
