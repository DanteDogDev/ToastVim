return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- stylua: ignore
  keys = {
    { "-", function() Harpoon:list():add() end, desc = "Harpoon File", },
    { "<leader>h", function() Harpoon.ui:toggle_quick_menu(Harpoon:list()) end, desc = "Harpoon Quick Menu", },
    { "<M-n>", function() Harpoon:list():next() end, desc = "Harpoon Next", },
    { "<M-p>", function() Harpoon:list():prev() end, desc = "Harpoon Prev", },

    { "<M-1>", function() Harpoon:list():select(1) end, desc = "Harpoon 1", },
    { "<M-2>", function() Harpoon:list():select(2) end, desc = "Harpoon 2", },
    { "<M-3>", function() Harpoon:list():select(3) end, desc = "Harpoon 3", },
    { "<M-4>", function() Harpoon:list():select(4) end, desc = "Harpoon 4", },
    { "<M-5>", function() Harpoon:list():select(5) end, desc = "Harpoon 5", },
    { "<M-6>", function() Harpoon:list():select(6) end, desc = "Harpoon 6", },
    { "<M-7>", function() Harpoon:list():select(7) end, desc = "Harpoon 7", },
    { "<M-8>", function() Harpoon:list():select(8) end, desc = "Harpoon 8", },
    { "<M-9>", function() Harpoon:list():select(9) end, desc = "Harpoon 9", },
    { "<M-0>", function() Harpoon:list():select(10) end, desc = "Harpoon 10", },
  },

  config = function()
    Harpoon = require("harpoon")
    Harpoon:setup({settings = {save_on_toggle = true}})

    local extensions = require("harpoon.extensions")
    Harpoon:extend(extensions.builtins.highlight_current_file())
    Harpoon:extend(extensions.builtins.navigate_with_number())
  end,
}
