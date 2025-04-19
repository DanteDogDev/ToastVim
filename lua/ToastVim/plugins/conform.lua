return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  formatters_by_ft = {
  },
  keys = {
    { "<leader>cF", function() require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000, }) end, desc = "Format with injected lang" }
  },
}
