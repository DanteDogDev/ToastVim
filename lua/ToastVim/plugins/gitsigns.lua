---@diagnostic disable: missing-fields
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  keys = {
  -- ToastVim.nmap("<leader>gl", function()  end, { desc = "Log" })
    { "<leader>gg", function() Snacks.lazygit( { cwd = vim.fn.getcwd() })  end, desc = "Lazygit" },
    { "<leader>gh", function() Snacks.picker.git_log_file()  end, desc = "Current File History" },
    { "<leader>gl", function() Snacks.picker.git_log({ cwd = vim.fn.getcwd() })end, desc = "Log" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Stash" },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Tracked Files" },
    { "<leader>gt", function() Snacks.picker.git_branches() end, desc = "Branches" },
    { "<leader>gt", function() Snacks.picker.git_grep() end, desc = "Grep" },
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
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
