return {
	{
		'celforyon/vimas',
		dependencies = {'tpope/vim-obsession'},
		config = function()
			os.execute('mkdir -p ' .. vim.fn.stdpath('state') .. '/sessions')
			vim.loop.new_timer():start(0, 0, vim.schedule_wrap(function()
				if vim.fn.exists('g:loaded_vimas') then
					vim.fn['vimas#vimas']()
				end
			end))
		end
	},
}
