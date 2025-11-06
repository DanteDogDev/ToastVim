return {
  "saghen/blink.cmp",
  -- dependencies = { "rafamadriz/friendly-snippets" },
  event = { "BufWritePost", "BufReadPost", "InsertEnter", "CmdLineEnter" },
  config = function(_, opts)
    require("blink-cmp").setup(opts)
    require("mason").setup()

    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    vim.lsp.config("*", { capabilities = capabilities })
  end,

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = {
      preset = "default",
      ["<Tab>"] = false,
      ["<S-Tab>"] = false,
      ["<C-CR>"] = { "accept" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    signature = {
      enabled = true,
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
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
        enabled = true,
      },
    },
    sources = {
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      completion = {
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
