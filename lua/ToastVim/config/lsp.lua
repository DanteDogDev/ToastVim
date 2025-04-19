require("mason").setup({})

local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config('*', { capabilities = capabilities, })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Formatting
    if client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<leader>cf', function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end, { buffer = args.buf, desc = 'Format Buffer' })
    end

  end,
})


vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
