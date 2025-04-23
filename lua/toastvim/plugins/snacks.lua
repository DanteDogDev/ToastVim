return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    toggle = {},
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit( { cwd = vim.fn.getcwd() })  end, desc = "Lazygit" },
  },
}
