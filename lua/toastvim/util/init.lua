---@class ToastVim.LSPConfig
---@field keymaps? ToastVim.LspKeymap[]

---@class ToastVim.TemplateConfig
---@field expressions? table


---@class ToastVim.Config
---@field lsp? ToastVim.LSPConfig    -- LSP configuration
---@field formatters_by_ft table
---@field linters_by_ft table

require("snacks")

require("toastvim.util.lsp")
require("toastvim.util.keymaps")
require("toastvim.util.template")
