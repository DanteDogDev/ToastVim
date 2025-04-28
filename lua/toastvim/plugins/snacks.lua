return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    toggle = {},
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    image = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit", },
    {
      "<leader>fN",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6, height = 0.6,
          wo = {
            spell = false, wrap = false,
            signcolumn = "yes", statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- UI
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.inlay_hints():map("<leader>uh")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
  end,
}
