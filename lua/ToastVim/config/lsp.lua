require("mason").setup({})
require("mason-lspconfig").setup({})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {current_line = true},
})
