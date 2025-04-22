require("mason").setup({})

local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.config('*', { capabilities = capabilities, })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method('textDocument/formatting') then
      ToastVim.nmap('<leader>cf', function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end, { buffer = args.buf, desc = 'Format Buffer' })
    end

    ToastVim.nmap("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = args.buf })
    ToastVim.nmap("<leader>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = args.buf })
    ToastVim.nmap("K", function() vim.lsp.buf.hover({border = 'rounded'}) end, { desc = "Hover", buffer = args.buf})
    ToastVim.imap("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = args.buf })
    ToastVim.nmap("<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics", buffer = args.buf })
  end,
})


vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
