return {
	{'tpope/vim-fugitive', cmd = {'G', 'Git'}},
	{
		'airblade/vim-gitgutter',
		cmd = {
			'GitGutterLineHighlightsToggle',
			'GitGutterSignsToggle',
			'GitGutterNextHunk',
			'GitGutterPrevHunk',
			'GitGutterFold',
		},
		init = function()
			vim.g.gitgutter_map_keys = 0
			vim.g.gitgutter_signs = 0
			vim.g.gitgutter_highlight_lines = 0
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {
			current_line_blame_opts = {
				virt_text_pos = 'right_align',
				delay = 50,
			},
		},
	},
}
