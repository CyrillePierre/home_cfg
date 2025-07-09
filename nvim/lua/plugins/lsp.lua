return {
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'williamboman/mason-lspconfig.nvim',

  -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   dependencies = {
  --     -- completion sources
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-cmdline',
  --     -- Snippets
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --     -- Overloads
  --     'Issafalcon/lsp-overloads.nvim',
  --   },
  -- },
  
  -- Autocompletion
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    version = '1.*',
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'enter',
        ['<C-s>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal'
      },
      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        accept = { auto_brackets = { enabled = true }, },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        ghost_text = { enabled = false },
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },

    },
    opts_extend = { "sources.default" },
  },

  {
    "folke/lazydev.nvim",
    event = "VeryLazy",
    config = true
  },

  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      grace_period = 10 * 60,  -- seconds
      wakeup_delay = 2 * 1000, -- milliseconds
      aggressive_mode = false,
    }
  },

  -- {
  --   'mfussenegger/nvim-lint',
  --   event = 'VeryLazy',
  -- },
  --
  -- {
  --   'rshkarin/mason-nvim-lint',
  --   dependencies = { 'mfussenegger/nvim-lint' },
  --   event = 'VeryLazy',
  --   config = true,
  -- },

  -- {
  --   'princejoogie/mason-formatter.nvim',
  --   event = 'VeryLazy',
  --   dependencies = { 'mhartington/formatter.nvim' },
  --   config = function()
  --     require('formatter').setup {
  --       filetype = {
  --         python = require("formatter.filetypes.python").ruff,
  --         cpp = require('formatter.filetypes.cpp').clangformat,
  --         c = require('formatter.filetypes.c').clangformat,
  --         rust = require('formatter.filetypes.rust').rustfmt,
  --         xml = require('formatter.filetypes.xml').xmlformatter,
  --       },
  --     }
  --
  --     require('mason-formatter').setup()
  --   end,
  -- },

  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format" },
          cpp = { "clangformat" },
          c = { "clangformat" },
          rust = { "rustfmt" },
          xml = { "xmlformatter" },
          yaml = { "prettier" },
        },
        -- log_level = vim.log.levels.DEBUG,
      }

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    end,
  },

  { -- automatically install Mason formatter defined in conform plugin
    "zapling/mason-conform.nvim",
    event = 'VeryLazy',
    dependencies = {
      'stevearc/conform.nvim',
      'williamboman/mason.nvim',
    },
  },
}
