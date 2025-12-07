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

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    },
    event = 'VeryLazy',
  },

  {  -- syntax highlighting for lilypond
    'martineausimon/nvim-lilypond-suite',
    opts = {
      -- edit config here (see "Customize default settings" in wiki)
    }
  },
}
