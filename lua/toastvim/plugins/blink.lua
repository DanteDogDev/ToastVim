return {
  "saghen/blink.cmp",
  -- dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = { preset = "super-tab" },
    appearance = {
      nerd_font_variant = "mono"
    },
    signature = {
      enabled = true,
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
      menu = {
        border = "rounded",
      },
      ghost_text = {
        enabled = true
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      completion = {
        ghost_text = {
          enabled = true
        }
      }
    }
  },
}
