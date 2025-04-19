local function mapkey(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
local function nmap(lhs, rhs, opts)
  mapkey("n", lhs, rhs, opts)
end
local function vmap(lhs, rhs, opts)
  mapkey("v", lhs, rhs, opts)
end
local function imap(lhs, rhs, opts)
  mapkey("i", lhs, rhs, opts)
end
local function map(lhs, rhs, opts)
  nmap(lhs, rhs, opts)
  vmap(lhs, rhs, opts)
end

require("mason").setup({})

local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.config('*', { capabilities = capabilities, })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method('textDocument/formatting') then
      map('<leader>cf', function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end, { buffer = args.buf, desc = 'Format Buffer' })
    end
    if client:supports_method('textDocument/codeAction') then
      map("gra", vim.lsp.buf.code_action, { desc = "Code Action", buffer = args.buf })
    end
    if client:supports_method('textDocument/signatureHelp') then
      imap("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = args.buf })
    end
    if client:supports_method('textDocument/definition') then
      map("gd", vim.lsp.buf.definition, { desc = "Go to Definition", buffer = args.buf })
    end
    if client:supports_method('textDocument/rename') then
      map("grn", vim.lsp.buf.rename, { desc = "Rename", buffer = args.buf })
    end
    if client:supports_method('textDocument/hover') then
      map("K", vim.lsp.buf.hover, { desc = "Hover", buffer = args.buf })
    end
    if client:supports_method('textDocument/references') then
      map("grr", vim.lsp.buf.references, { desc = "References", buffer = args.buf })
    end
    if client:supports_method('textDocument/implementation') then
      map("gri", vim.lsp.buf.implementation, { desc = "Implementation", buffer = args.buf })
    end
    if client:supports_method('textDocument/declaration') then
      map("gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = args.buf })
    end
    if client:supports_method('textDocument/typeDefinition') then
      map("gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition", buffer = args.buf })
    end
  end,
})


vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
