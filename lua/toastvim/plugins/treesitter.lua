return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  build = ":TSUpdate",
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "vim",
      "vimdoc",
      "query",
      "regex",
      "bash",

      "markdown",
      "markdown-inline",
      "html",
      "typst",
      "yaml",
    },
    auto_install = true,
  },
}
