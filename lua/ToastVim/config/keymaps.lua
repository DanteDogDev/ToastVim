local function mapkey(mode, lhs, rhs, opts)
local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
  mapkey("n", lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
  mapkey("v", lhs, rhs, opts)
end

local function map(lhs, rhs, opts)
  nmap(lhs, rhs, opts)
  vmap(lhs, rhs, opts)
end

mapkey({"n", "v"}, "<ESC>", function() vim.cmd("nohlsearch") return "<ESC>" end, 
  { expr = true, desc = "Escape and clear hlsearch" }
)
map("<leader>uL", "<CMD>Lazy<CR>", {desc = "Lazy"})
--
-- quit
nmap("<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })

-- Goto start/end of line
map("gh", "^", { desc = "Start of line" })
map("gl", "$", { desc = "End of line" })

-- Move to window using the <ctrl> hjkl keys
nmap("<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
nmap("<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
nmap("<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
nmap("<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
nmap("<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
nmap("<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
nmap("<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
nmap("<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

