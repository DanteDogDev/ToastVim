return {
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = "Mason",
    keys = {
      { "<leader>uM", "<CMD>Mason<CR>", desc = "Mason" }
    },
  },

  -- lua specific
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { "ToastVim" },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  }
}
