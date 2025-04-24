return {
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = false,
        width_focus = 30,
        width_preview = 30,
      },
    },
    keys = {
      { "<leader>e", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open mini.files (Directory of Current File)", },
      { "<leader>E", function() require("mini.files").open(vim.uv.cwd(), true) end, desc = "Open mini.files (cwd)", },
    },
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "echasnovski/mini.move",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    opts = {},
  },
  {
    "echasnovski/mini.misc",
    -- event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    event = "VeryLazy",
    config = function()
      require("mini.misc").setup_auto_root()
    end,
  },
}
