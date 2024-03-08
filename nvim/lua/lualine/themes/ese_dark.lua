local colors = {
	bg        = '#202328',
	fg        = '#bbc2cf',
	active    = '#e0e0e0',
	inactive  = '#909090',

	yellow    = '#ECBE7B',
	cyan      = '#008080',
	darkblue  = '#081633',
	green     = '#98be65',
	orange    = '#FF8800',
	violet    = '#a9a1e1',
	magenta   = '#c678dd',
	blue      = '#51afef',
	red       = '#ec5f67',
}

local theme = {
	normal = {
		c = { fg = colors.fg, bg = colors.bg },
	},
	inactive = {
		c = { fg = colors.fg, bg = colors.bg },
	},
}

function theme.colors()
	return colors
end

return theme
