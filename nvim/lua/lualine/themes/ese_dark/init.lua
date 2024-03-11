local colors = require('lualine.themes.ese_dark.colors')

local theme = {
	normal = {
		a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
		c = { fg = colors.fg, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.active, bg = colors.bg, gui = 'bold' },
		c = { fg = colors.inactive, bg = colors.bg },
	},
}

return theme
