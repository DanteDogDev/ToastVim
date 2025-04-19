return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>cl", function() require("lint").try_lint() end, desc = "Trigger Linting" }
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = {
    }

    -- Linting
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
