return {
	{
		'ibhagwan/fzf-lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			{'junegunn/fzf', build = './install --bin'}, -- just to install fzf
		},
		config = function()
			require('fzf-lua').setup{
				winopts = {width=.95, height=.9},
			}
		end,
		cmd = 'FzfLua',
	},
}
