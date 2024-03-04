return {
	{'chaoren/vim-wordmotion', event = 'VeryLazy'},
	{'tpope/vim-characterize', event = 'VeryLazy'},
	-- 'tpope/vim-sleuth',

	{'nvim-tree/nvim-web-devicons', lazy = true},

	{
		'akinsho/toggleterm.nvim',
		cmd = {'ToggleTerm', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualLines'},
		config = true,
	},
}
