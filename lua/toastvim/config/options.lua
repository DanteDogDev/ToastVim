vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.undolevels = 10000

-----------------------------------------------------------
-- Lsp
-----------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true -- Show line number
vim.opt.relativenumber = true -- Show relative line number
vim.opt.showmatch = false -- Highlight matching parenthesis
vim.opt.colorcolumn = "120" -- Line lenght marker at 120 columns
vim.opt.wrap = false -- Disables word wrap
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.ruler = false -- Disable the default ruler
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
-- vim.o.winborder = "none"     -- Causes problems with plugins that dont set a winborder in their floats

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-----------------------------------------------------------
-- Folding (needs work)
-----------------------------------------------------------
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"

-----------------------------------------------------------
-- Search && Highlights
-----------------------------------------------------------
vim.opt.hlsearch = true -- Highlights the results of the search
vim.opt.ignorecase = true -- Ignore case letters when search
vim.opt.smartcase = true -- Don't ignore case with capitals

-----------------------------------------------------------
-- Window
-----------------------------------------------------------
vim.opt.splitright = true -- Vertical split to the right
vim.opt.splitbelow = true -- Horizontal split to the bottom
vim.opt.laststatus = 3 -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Shift 4 spaces when tab
vim.opt.tabstop = 2 -- 1 tab == 4 spaces
vim.opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true -- Enable background buffersvim.opt.tabstop = 2
vim.opt.history = 100 -- Remember N lines in history
vim.opt.synmaxcol = 240 -- Max column for syntax highlight
vim.opt.updatetime = 250 -- ms to wait for trigger an event
