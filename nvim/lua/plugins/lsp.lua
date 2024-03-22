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
}
