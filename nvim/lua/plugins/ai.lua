return {
	{
		'robitx/gp.nvim',
		config = function()
			return os.getenv('OPENAI_API_KEY') ~= nil
		end,
		lazy = true,
	},
}
