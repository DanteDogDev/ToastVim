return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  build = ":TSUpdate",
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    auto_install = true,
    highlight = { enable = true },
    ensure_installed = {
      "vim",
      "vimdoc",
      "query",
      "regex",
      "bash",
      "lua",

      "markdown",
      "markdown_inline",
      "html",
      "typst",
      "yaml",

      "css",
      "javascript",
      "norg",
      "scss",
      "svelte",
      "tsx",
      "vue",
    },
  },
}
