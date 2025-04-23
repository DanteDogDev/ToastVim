---@class ToastVim.LspKeymap
---@field mode string|string[]     -- Mode(s) like "n", "i", "v", etc.
---@field keys string              -- Keybinding
---@field action function          -- Function to execute
---@field opts? table              -- Options passed to `vim.keymap.set`
---@field has? string              -- Optional capability check (like "textDocument/formatting")
---@field ft? string|string[]               -- file type

ToastVim.lsp = {}

---@type ToastVim.LspKeymap[]
ToastVim.lsp.keymaps = {
  {
    mode = "n",
    keys = "<leader>cf",
    action = function()
      vim.lsp.buf.format()
    end,
    opts = { desc = "Format Buffer" },
    has = "textDocument/formatting",
  },
  {
    mode = "n",
    keys = "<leader>ca",
    action = vim.lsp.buf.code_action,
    opts = { desc = "Code Action" },
  },
  {
    mode = "n",
    keys = "<leader>cr",
    action = vim.lsp.buf.rename,
    opts = { desc = "Rename" },
  },
  {
    mode = "n",
    keys = "K",
    action = function()
      vim.lsp.buf.hover({ border = "rounded" })
    end,
    opts = { desc = "Hover" },
  },
  {
    mode = "i",
    keys = "<C-k>",
    action = vim.lsp.buf.signature_help,
    opts = { desc = "Signature Help" },
  },
  {
    mode = "n",
    keys = "<leader>cd",
    action = vim.diagnostic.open_float,
    opts = { desc = "Line Diagnostics" },
  },
}
