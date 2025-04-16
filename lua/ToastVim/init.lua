local M = {}

M.setup = function(opts)
  require("ToastVim.config.options")
  require("ToastVim.config.keymaps")
  require("ToastVim.config.autocmds")
end

return M
