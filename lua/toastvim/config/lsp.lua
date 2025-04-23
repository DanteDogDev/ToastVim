require("mason").setup()

local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.config("*", { capabilities = capabilities, })

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
