return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- When installing formatter you need to set it here
    formatters_by_ft = {},
    keys = {
      { "<leader>cF", function() require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000, }) end, desc = "Format with injected lang" }
    },
  },
  -- Linter
  {
    "mfussenegger/nvim-lint",
    keys = {
      { "<leader>cl", function() require("lint").try_lint() end, desc = "Lint Buffer" }
    },
    opts = {
      -- When installing linter you need to set it here
      linters_by_ft = {},
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
}
