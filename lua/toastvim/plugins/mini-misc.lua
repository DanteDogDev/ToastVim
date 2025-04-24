return {
  "echasnovski/mini.misc",
  -- event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  event = "VeryLazy",
  config = function()
    require("mini.misc").setup_auto_root()
  end
}
