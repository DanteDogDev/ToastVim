return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- Explorer
    { "<leader>ft", function() Snacks.explorer() end, desc = "File Tree", },

    -- Picker
    { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Search" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>\\", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    -- { "<leader>n", function() require("noice").cmd("all") end, desc = "Notification History" },

    -- Find
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

    -- Search
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

    -- UI
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },

    -- LSP
    { "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Git
    { "<leader>gh", function() Snacks.picker.git_log_file()  end, desc = "Current File History" },
    { "<leader>gl", function() Snacks.picker.git_log({ cwd = vim.fn.getcwd() })end, desc = "Log" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Stash" },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Tracked Files" },
    { "<leader>gt", function() Snacks.picker.git_branches() end, desc = "Branches" },
    { "<leader>gt", function() Snacks.picker.git_grep() end, desc = "Grep" },
  },
}
