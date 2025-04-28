ToastVim.map = function(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

ToastVim.nmap = function(lhs, rhs, opts)
  ToastVim.map("n", lhs, rhs, opts)
end

ToastVim.vmap = function(lhs, rhs, opts)
  ToastVim.map("v", lhs, rhs, opts)
end

ToastVim.imap = function(lhs, rhs, opts)
  ToastVim.map("i", lhs, rhs, opts)
end

ToastVim.nvmap = function(lhs, rhs, opts)
  ToastVim.nmap(lhs, rhs, opts)
  ToastVim.vmap(lhs, rhs, opts)
end
