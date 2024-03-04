return {
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		init = function()
			vim.g.startuptime_tries = 5
			vim.g.startuptime_sourced = false
		end,
	},
}
