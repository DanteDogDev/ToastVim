local M = {}


---@class ToastVim.LSPConfig
---@field keymaps? ToastVim.LspKeymap[]

---@class ToastVim.Config
---@field lsp? ToastVim.LSPConfig    -- LSP configuration


---@param opts ToastVim.Config
M.setup = function(opts)
  require("ToastVim.util")
  require("ToastVim.config")

  if opts.lsp and opts.lsp.keymaps then
    ToastVim = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps, opts.lsp.keymaps)
  end
end

return M
