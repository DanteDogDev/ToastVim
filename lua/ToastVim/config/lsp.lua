require("mason").setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<leader>cf', function()
        vim.lsp.buf.format({ bufnr = args.buf })
      end, { buffer = args.buf, desc = 'Format Buffer' })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {current_line = true},
})
