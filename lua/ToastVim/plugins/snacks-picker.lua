return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
    }
  },
  -- stylua: ignore
  keys = { -- TODO: REWORK
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>\\", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
    { "<leader>fc", function() Snacks.picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Find Config File" },
    { "<leader>fC", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },

    { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent (cwd)" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },

    -- Grep
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep Word", mode = { "n", "x" } },

    -- search
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },

    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },

    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undotree" },

    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },

    -- FIXME: 
    { "<leader>s<C-c>", function() Snacks.picker.cliphist() end, desc = "Clipboard History" },


    -- ui
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },
}
