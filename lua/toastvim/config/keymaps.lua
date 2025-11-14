ToastVim.nvmap("<ESC>", function()
  vim.cmd("nohlsearch")
  return "<ESC>"
end, { expr = true, desc = "Escape and clear hlsearch" })

-- open lazy ui
ToastVim.nmap("<leader>uL", "<CMD>Lazy<CR>", { desc = "Lazy" })

-- Disable lsp default keymaps
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")

-- Deleting
ToastVim.nvmap("x", '"_x')

-- Goto start/end of line
ToastVim.nvmap("gh", "^", { desc = "Start of line" })
ToastVim.nvmap("gl", "$", { desc = "End of line" })

-- Move to window using the <ctrl> hjkl keys
ToastVim.nmap("<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
ToastVim.nmap("<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
ToastVim.nmap("<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
ToastVim.nmap("<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
ToastVim.nmap("<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
ToastVim.nmap("<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
ToastVim.nmap("<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
ToastVim.nmap("<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Quickfix List
ToastVim.nmap("<leader>xq",
function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

ToastVim.nmap("[q", vim.cmd.cprev, { desc = "Previous Quickfix" }) -- Gets overridden by trouble.nvim
ToastVim.nmap("]q", vim.cmd.cnext, { desc = "Next Quickfix" })
