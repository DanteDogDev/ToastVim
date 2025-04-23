---@class ToastVim.LSPConfig
---@field keymaps? ToastVim.LspKeymap[]
---@class ToastVim.Config
---@field lsp? ToastVim.LSPConfig    -- LSP configuration

ToastVim = {
  lsp = {
    keymaps = {
    }
  }
}
require("snacks")
require("toastvim.util.lsp")
require("toastvim.util.keymaps")
