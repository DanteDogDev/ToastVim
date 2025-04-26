local M = {}

---@param opts ToastVim.Config
M.setup = function(opts)
  require("toastvim.util")
  require("toastvim.config")

  if opts.lsp and opts.lsp.keymaps then
    if opts.lsp.keymaps then
      ToastVim = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps, opts.lsp.keymaps)
    end
    if opts.lsp.formatters_by_ft then
      ToastVim = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps, opts.lsp.formatters_by_ft)
    end
    if opts.lsp.linters_by_ft then
      ToastVim = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps, opts.lsp.linters_by_ft)
    end
  end
end

return M
