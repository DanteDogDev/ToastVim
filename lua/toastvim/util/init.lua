---@class ToastVim.LSPConfig
---@field keymaps? ToastVim.LspKeymap[]
---@field formatters_by_ft table
---@field linters_by_ft table

---@class ToastVim.Config
---@field lsp? ToastVim.LSPConfig    -- LSP configuration

ToastVim = {
  linters_by_ft = {},
  formatters_by_ft = {},
  lsp = {
    keymaps = {},
  },
  template = {
    expressions = {},
    replacer = {},
  },
}

require("toastvim.util.lsp")
require("toastvim.util.keymaps")
require("toastvim.util.template")
