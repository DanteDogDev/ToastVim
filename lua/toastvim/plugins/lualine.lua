return {
  "nvim-lualine/lualine.nvim",
  event = { "BufWritePost", "BufReadPost" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
    },
    sections = {
      lualine_x = {
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
      },
    },
    extensions = { "lazy", "mason" },
  },
}
