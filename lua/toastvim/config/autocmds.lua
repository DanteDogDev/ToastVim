-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- Load Lsp Keymaps into buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    local ft = vim.bo[args.buf].filetype
    for _, map in ipairs(ToastVim.lsp.keymaps) do
      if ((not map.ft or vim.tbl_contains(map.ft,ft))and (not map.has or client:supports_method(map.has))) then
        local opts = vim.tbl_extend("force", { buffer = args.buf }, map.opts or {})
        ToastVim.mapkey(map.mode, map.keys, map.action, opts)
      end
    end
  end,
})
