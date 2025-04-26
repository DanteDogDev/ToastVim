---@class ToastVim.LspKeymap
---@field mode string|string[]     -- Mode(s) like "n", "i", "v", etc.
---@field keys string              -- Keybinding
---@field action function          -- Function to execute
---@field opts? table              -- Options passed to `vim.keymap.set`
---@field has? string              -- Optional capability check (like "textDocument/formatting")
---@field ft? string|string[]               -- file type

vim.list_extend(ToastVim.lsp.keymaps,
---@type ToastVim.LspKeymap[]
{
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
    has = "textDocument/codeAction",
  },
  {
    mode = "n",
    keys = "<leader>cr",
    action = vim.lsp.buf.rename,
    opts = { desc = "Rename" },
    has = "textDocument/rename"
  },
  {
    mode = "n",
    keys = "K",
    action = function()
      vim.lsp.buf.hover({ border = "rounded" })
    end,
    opts = { desc = "Hover" },
    has = "textDocument/hover"
  },
  {
    mode = "i",
    keys = "<C-k>",
    action = vim.lsp.buf.signature_help,
    opts = { desc = "Signature Help" },
    has = "textDocument/signatureHelp"
  },
  {
    mode = "n",
    keys = "<leader>cd",
    action = vim.diagnostic.open_float,
    opts = { desc = "Line Diagnostics" },
  },
  {
    mode = "n",
    keys = "gd",
    action = Snacks.picker.lsp_definitions,
    opts = { desc = "Goto Definition" },
    has = "textDocument/definition"
  },
  {
    mode = "n",
    keys = "gD",
    action = Snacks.picker.lsp_declarations,
    opts = { desc = "Goto Declaration" },
    has = "textDocument/declaration"
  },
  {
    mode = "n",
    keys = "gr",
    action = Snacks.picker.lsp_references,
    opts = { desc = "Goto References" },
    has = "textDocument/references"
  },
  {
    mode = "n",
    keys = "gI",
    action = Snacks.picker.lsp_implementations,
    opts = { desc = "Goto Implementation" },
    has = "textDocument/implementation"
  },
  {
    mode = "n",
    keys = "gy",
    action = Snacks.picker.lsp_type_definitions,
    opts = { desc = "Goto Type Definition" },
    has = "textDocument/typeDefinition"
  },
})

    -- { "gd", function() () end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
