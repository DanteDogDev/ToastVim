# Toastvim

Welcome to **Toastvim** – Where your code gets *Toast*, just like *Toast*!!!!!!

## Features

- **Toast**: TOAST!!!!
- **Template**: File template support using expressions to autofill information

## Requirements

- curl
- lua
- lua51
- luarocks
- git
- lazygit
- fd
- ripgrep
- fzf
- rust
- tree-sitter-cli

## Lazy.nvim

```lua
return {
  "DanteDogDev/ToastVim",
  import = "toastvim.plugins",

  ---@type ToastVim.Config
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    linters_by_ft = {
    },
    template = {
      expressions = {
        ["${FILENAME}"] = function() return vim.fn.expand("%:t:r") end,
        ["${DATE}"] = function() return os.date("%d/%m/%y") end,
        ["${AUTHOR}"] = function() return vim.fn.system("git config user.name"):gsub("\n", "") end,
        ["${EMAIL}"] = function() return vim.fn.system("git config user.email"):gsub("\n", "") end,
        ["${PROJECT}"] = function() return vim.fn.system('powershell -Command "Split-Path -Leaf (Get-Location)"'):gsub("\n", "") end,
      },
    },
  },
}
```

