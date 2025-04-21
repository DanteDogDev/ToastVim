return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>cl", function() require("lint").try_lint() end, desc = "Lint Buffer" }
  },
  opts = {
    linters_by_ft = {
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft

    -- Linting
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = "Linter",
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
