ToastVim.map("<ESC>", function()
    vim.cmd("nohlsearch")
    return "<ESC>"
  end,
  { expr = true, desc = "Escape and clear hlsearch" }
)

-- quit
ToastVim.nmap("<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })
ToastVim.nmap("<leader>uL", "<CMD>Lazy<CR>", { desc = "Lazy" })

-- Goto start/end of line
ToastVim.map("gh", "^", { desc = "Start of line" })
ToastVim.map("gl", "$", { desc = "End of line" })

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

-- UI
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.inlay_hints():map("<leader>uh") -- TEST:
Snacks.toggle.diagnostics():map("<leader>ud") -- TEST:
