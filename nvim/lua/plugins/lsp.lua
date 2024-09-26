return {
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = {'InsertEnter', 'CmdlineEnter'},
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

	{'folke/neodev.nvim', config = true},

  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      grace_period = 10 * 60,  -- seconds
      wakeup_delay = 2 * 1000,  -- milliseconds
      aggressive_mode = false,
    }
  },

  {
    'mfussenegger/nvim-lint',
		event = 'VeryLazy',
  },

  {
    'rshkarin/mason-nvim-lint',
		event = 'VeryLazy',
    config = true,
  },

  {
    'princejoogie/mason-formatter.nvim',
    event = 'VeryLazy',
    dependencies = { 'mhartington/formatter.nvim' },
    config = function()
      require('formatter').setup {
        filetype = {
          python = require("formatter.filetypes.python").ruff,
          cpp = require('formatter.filetypes.cpp').clangformat,
          c = require('formatter.filetypes.c').clangformat,
          rust = require('formatter.filetypes.rust').rustfmt,
        },
      }

      require('mason-formatter').setup()
    end,
  },
}
