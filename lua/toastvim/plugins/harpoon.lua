return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader><S-h>", function() Harpoon:list():add() end, desc = "Harpoon File", },
    { "<leader>h", function() Harpoon.ui:toggle_quick_menu(Harpoon:list()) end, desc = "Harpoon Quick Menu", },
    { "<M-n>", function() Harpoon:list():next() end, desc = "Harpoon Next", },
    { "<M-p>", function() Harpoon:list():prev() end, desc = "Harpoon Prev", },

    { "<M-1>", function() Harpoon:list():select(1) end, desc = "Harpoon 1", },
    { "<M-2>", function() Harpoon:list():select(2) end, desc = "Harpoon 2", },
    { "<M-3>", function() Harpoon:list():select(3) end, desc = "Harpoon 3", },
    { "<M-4>", function() Harpoon:list():select(4) end, desc = "Harpoon 4", },
  },

  config = function(_, opts)
    Harpoon = require("harpoon")
    Harpoon:setup(opts)

    local extensions = require("harpoon.extensions")
    Harpoon:extend(extensions.builtins.highlight_current_file())
    Harpoon:extend(extensions.builtins.navigate_with_number());
  end
}
