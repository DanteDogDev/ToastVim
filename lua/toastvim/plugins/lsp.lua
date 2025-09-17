return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>sL", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = "Mason",
    keys = {
      { "<leader>uM", "<CMD>Mason<CR>", desc = "Mason" },
    },
  },
  -- FORMATTER
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("conform").setup({ formatters_by_ft = ToastVim.formatters_by_ft })
    end,
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
        end,
        desc = "Format Buffer",
      },
    },
  },
  -- LINTER
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cl",
        function()
          require("lint").try_lint()
        end,
        desc = "Lint Buffer",
      },
    },
    opts = {},
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = ToastVim.linters_by_ft

      -- Linting
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("ToastVim.lsp.linter", {}),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- LUA
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { "ToastVim" },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}
