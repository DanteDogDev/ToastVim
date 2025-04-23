local M = {}

---@param opts ToastVim.Config
M.setup = function(opts)
  require("toastvim.util")
  require("toastvim.config")

  if opts.lsp and opts.lsp.keymaps then
    ToastVim = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps, opts.lsp.keymaps)
  end
end

return M
