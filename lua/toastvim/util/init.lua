---@class ToastVim.LSPConfig
---@field keymaps? ToastVim.LspKeymap[]
---@class ToastVim.Config
---@field lsp? ToastVim.LSPConfig    -- LSP configuration

ToastVim = {
  lsp = {
    keymaps = {
    }
  },
  template = {
    expressions = {},
    replacer = {}
  }
}

require("toastvim.util.lsp")
require("toastvim.util.keymaps")
require("toastvim.util.template")
