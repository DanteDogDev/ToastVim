return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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
        "<leader>cF",
        function()
          require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
        end,
        desc = "Format with injected lang",
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
    opts = {
      -- When installing linter you need to set it here
      -- linters_by_ft = {},
    },
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

  -- MARKDOWN HTML TYPST
  {
    "OXY2DEV/markview.nvim",
    branch = "dev",
    dependencies = {
      "saghen/blink.cmp",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "markdown", "html", "yaml", "typst" },
    ---@class mkv.config
		keys = {
			{ "<leader>cp", "<Cmd>Markview toggle<CR>", desc = "toggle markdown preview", ft = "markdown"}
		},
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
        { path = "markview.nvim", words = { "mkv" } },
      },
    },
  },
}
