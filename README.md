# Toastvim

Welcome to **Toastvim** – Where your code gets *Toast*, just like *Toast*!!!!!!

![Toast](./toast.jpg)

## Features

- **Toast**: TOAST!!!!
- **Template**: File template support using expressions to autofill information

## Requirements

<details>
<summary>Dependences</summary>

- lazy.nvim
- lua
- lua51
- luarocks
- git
- lazygit
- fd
- ripgrep
- fzf
- nodejs
- npm
- curl
- tree-sitter-cli
- tectonic
- ghostscript

</details>

## Installation

<details>
<summary>Lazy.nvim</summary>

```lua
-- Good basic setup
return {
  "DanteDogDev/ToastVim",
  import = "toastvim.plugins",

  ---@type ToastVim.Config
  opts = {
    -- Gets piped into conform.nvim
    formatters_by_ft = {
      lua = { "stylua" },
    },
    -- Gets piped into nvim-lint
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

</details>

## opts

<details>
<summary>opts</summary>

```lua
opts = {
    formatters_by_ft = {
        lua = { "stylua" },
    },
    linters_by_ft = {
    },
    lsp = {
        keymaps = {
          {
            mode = "n",
            keys = "",
            action = function()
            end,
            opts = { desc = "" },
            has = "textDocument/...",
          },
        },
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
```

</details>
