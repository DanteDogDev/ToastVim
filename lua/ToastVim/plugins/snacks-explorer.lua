return {
  "folke/snacks.nvim",
  opts = {
    explorer = {}
  },
  keys = {
    {
      "<leader>ft",
      function() Snacks.explorer() end,
      desc = "File Tree",
    },
    {
      "<leader>fT",
      function() Snacks.explorer({cwd = vim.uv.cwd()}) end,
      desc = "File Tree (root dir)",
    },
  },
}
