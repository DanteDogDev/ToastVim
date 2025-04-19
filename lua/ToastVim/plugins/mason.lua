return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {},
  cmd = "Mason",
  keys = { 
    { "<leader>uM", "<CMD>Mason<CR>", desc = "Mason" } 
  },
}
