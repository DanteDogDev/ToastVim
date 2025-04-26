local M = {}

---@param opts ToastVim.Config
M.setup = function(opts)
  ToastVim = ToastVim
    or {
      linters_by_ft = {},
      formatters_by_ft = {},
      lsp = {
        keymaps = {},
      },
      template = {
        tmp_path = vim.fn.stdpath("config") .. "/templates",
        expressions = {},
      },
    }

  ToastVim.formatters_by_ft = vim.tbl_deep_extend("force", ToastVim.formatters_by_ft or {}, opts.formatters_by_ft or {})
  ToastVim.linters_by_ft = vim.tbl_deep_extend("force", ToastVim.linters_by_ft or {}, opts.linters_by_ft or {})
  ToastVim.lsp.keymaps = vim.tbl_deep_extend("force", ToastVim.lsp.keymaps or {}, opts.lsp and opts.lsp.keymaps or {})
  ToastVim.template.expressions = vim.tbl_deep_extend("force", ToastVim.template.expressions or {}, opts.template and opts.template.expressions or {})

  require("toastvim.util")
  require("toastvim.config")
end

return M
