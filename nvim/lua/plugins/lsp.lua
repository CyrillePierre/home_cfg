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

	-- {
	-- 	'hinell/lsp-timeout.nvim',
	-- 	init = function()
	-- 		vim.g.lspTimeoutConfig = {
	-- 			stopTimeout = 1000 * 60 * 5,
	-- 			startTimeout = 1000 * 2.5,
	-- 			silent = true,
	-- 		}
	-- 	end,
	-- 	event = 'VeryLazy',
	-- 	dependencies = {'neovim/nvim-lspconfig'}
	-- },

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
