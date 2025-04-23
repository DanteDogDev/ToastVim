return {
  "echasnovski/mini.misc",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  config = function()
    require("mini.misc").setup_auto_root()
  end
}
