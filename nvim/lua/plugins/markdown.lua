return {
	{'godlygeek/tabular', cmd = 'Tabularize'},
	{
		'plasticboy/vim-markdown',
		ft = 'md',
		init = function()
			vim.g.vim_markdown_no_default_key_mappings = 1
		end,
	},
	{'iamcco/markdown-preview.nvim', ft = 'md'},
	{'dhruvasagar/vim-table-mode', ft = 'md'},
}
