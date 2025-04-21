return {
  "lewis6991/gitsigns.nvim",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  keys = {
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (hunks)" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Find Files (git-files)" },
  },
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end
      map("n", "]h", function()
        if vim.wo.diff then vim.cmd.normal({ "]c", bang = true })
        else gs.nav_hunk("next") end
      end, "Next Hunk")
      map("n", "[h", function()
        if vim.wo.diff then vim.cmd.normal({ "[c", bang = true })
        else gs.nav_hunk("prev") end
      end, "Prev Hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>gB", function() gs.blame() end, "Blame Buffer")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      Snacks.toggle({
        name = "Git Signs",
        get = function() return require("gitsigns.config").config.signcolumn end,
        set = function(state) require("gitsigns").toggle_signs(state) end,
      }):map("<leader>uG")
    end,
  },
}
