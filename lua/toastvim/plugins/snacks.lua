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
    { "<leader>gg", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit", },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- UI
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.inlay_hints():map("<leader>uh")
    Snacks.toggle.diagnostics():map("<leader>ud")
  end,
}
