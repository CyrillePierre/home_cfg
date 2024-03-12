return {
	{
		'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
		cmd = 'Neotree',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },

		config = function()
			require('neo-tree').setup{
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = true,
						hide_gitignored = true,
						hide_by_pattern = {
							--"*.meta",
							--"*/src/*/tsconfig.json",
						},
						always_show = { -- remains visible even if other settings would normally hide it
							'src',
						},
					},
				}
			}
		end,
	},
}
