return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
  },
  keys = {
    { "<leader>?", "<CMD>WhichKey<CR>", desc = "Keymaps", }
  },
}
