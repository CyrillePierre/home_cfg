return {
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'williamboman/mason-lspconfig.nvim',

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      -- completion sources
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Overloads
      'Issafalcon/lsp-overloads.nvim',
    },
  },

  {
    "folke/neodev.nvim",
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

  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
  },

  {
    'rshkarin/mason-nvim-lint',
    dependencies = { 'mfussenegger/nvim-lint' },
    event = 'VeryLazy',
    config = true,
  },

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
          python = { "ruff" },
          cpp = { "clangformat" },
          c = { "clangformat" },
          rust = { "rustfmt" },
          xml = { "xmlformatter" },
          yaml = { "prettierd" },
        },
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
