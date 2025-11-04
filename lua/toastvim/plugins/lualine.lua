local mode_map = {
  ["NORMAL"] = "N",
  ["O-PENDING"] = "O?",
  ["INSERT"] = "I",
  ["VISUAL"] = "V",
  ["V-BLOCK"] = "VB",
  ["V-LINE"] = "VL",
  ["V-REPLACE"] = "VR",
  ["REPLACE"] = "R",
  ["COMMAND"] = "!",
  ["SHELL"] = "SH",
  ["TERMINAL"] = "T",
  ["EX"] = "X",
  ["S-BLOCK"] = "SB",
  ["S-LINE"] = "SL",
  ["SELECT"] = "S",
  ["CONFIRM"] = "Y?",
  ["MORE"] = "M",
}

local filename_fn

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufWritePost", "BufReadPost" },
  config = function()
    filename_fn = require("lualine.components.filename"):extend()
    local highlight = require("lualine.highlight")
    local theme = require("lualine.themes.auto")
    function filename_fn:init(options)
      filename_fn.super.init(self, options)
      self.status_colors = {
        ---@diagnostic disable-next-line: param-type-mismatch
        saved = highlight.create_component_highlight_group("StatusLine", "saved", self.options),
        ---@diagnostic disable-next-line: param-type-mismatch
        modified = highlight.create_component_highlight_group("Error", "modified", self.options),
      }
      if self.options.color == nil then
        self.options.color = ""
      end
    end

    function filename_fn:update_status()
      local data = filename_fn.super.update_status(self)
      data = highlight.component_format_highlight(vim.bo.modified and self.status_colors.modified or self.status_colors.saved) .. data
      return data
    end

    local function macro_status()
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        return "Recording @" .. reg
      else
        return ""
      end
    end

    Lualine = require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { {
          "mode",
          fmt = function(s)
            return mode_map[s] or s
          end,
        } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { filename_fn },
        lualine_x = { { macro_status, color = "WarningMsg" } },
        lualine_y = { "lsp_status" },
        lualine_z = { "location" },
      },
      extensions = { "lazy", "mason" },
    })
  end,
}
