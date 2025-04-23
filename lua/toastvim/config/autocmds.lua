vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  group = vim.api.nvim_create_augroup("ToastVim.yank_highlight", {}),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Load Lsp Keymaps into buffer",
  group = vim.api.nvim_create_augroup("ToastVim.lsp.attach",{}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    local ft = vim.bo[args.buf].filetype
    for _, map in ipairs(ToastVim.lsp.keymaps) do
      ---@diagnostic disable-next-line: param-type-mismatch
      if ((not map.ft or vim.tbl_contains(map.ft,ft))and (not map.has or client:supports_method(map.has))) then
        local opts = vim.tbl_extend("force", { buffer = args.buf }, map.opts or {})
        ToastVim.mapkey(map.mode, map.keys, map.action, opts)
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinScrolled" }, {
	desc = "Fix scrolloff when you are at the EOF",
  group = vim.api.nvim_create_augroup("ToastVim.scrolloff", {}),
	callback = function()
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return -- Ignore floating windows
		end

		local win_height = vim.fn.winheight(0)
		local scrolloff = math.min(vim.o.scrolloff, math.floor(win_height / 2))
		local visual_distance_to_eof = win_height - vim.fn.winline()

		if visual_distance_to_eof < scrolloff then
			local win_view = vim.fn.winsaveview()
			vim.fn.winrestview({ topline = win_view.topline + scrolloff - visual_distance_to_eof })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Automatically Split help Buffers to the right",
  group = vim.api.nvim_create_augroup("ToastVim.help_ft", {}),
	pattern = "help",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("ToastVim.close_q", {}),
  desc = "close some filetypes with q",
  pattern = {
    "checkhealth",
    "help",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
