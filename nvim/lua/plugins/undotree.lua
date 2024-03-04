return {
	{
		'mbbill/undotree',
		cmd = 'UndotreeToggle',
		init = function()
			vim.g.undotree_WindowLayout = 4
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_DiffpanelHeight = 6
		end,
	},
}
