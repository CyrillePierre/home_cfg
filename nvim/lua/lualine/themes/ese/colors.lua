local colors = {}

function colors.update()
	print('background: ' .. vim.o.background)

	if vim.o.background == 'dark' then
		colors.bg        = '#202328'
		colors.fg        = '#bbc2cf'
		colors.active    = '#e0e0e0'
		colors.inactive  = '#909090'

		colors.yellow    = '#ECBE7B'
		colors.cyan      = '#008080'
		colors.darkblue  = '#081633'
		colors.green     = '#98be65'
		colors.orange    = '#FF8800'
		colors.violet    = '#a9a1e1'
		colors.magenta   = '#c678dd'
		colors.blue      = '#51afef'
		colors.red       = '#ec5f67'
	else
		colors.bg        = '#202328'
		colors.fg        = '#bbc2cf'
		colors.active    = '#e0e0e0'
		colors.inactive  = '#909090'

		colors.yellow    = '#ECBE7B'
		colors.cyan      = '#008080'
		colors.darkblue  = '#081633'
		colors.green     = '#98be65'
		colors.orange    = '#FF8800'
		colors.violet    = '#a9a1e1'
		colors.magenta   = '#c678dd'
		colors.blue      = '#51afef'
		colors.red       = '#ec5f67'
	end
end

return colors
