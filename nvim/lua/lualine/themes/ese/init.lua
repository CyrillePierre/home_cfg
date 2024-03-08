print('lualine.themes.ese: init called')
local colors = require('lualine.themes.ese.colors')
colors.update()

if vim.o.background == 'dark' then
	print('bgnd dark')
else
	print('bgnd light')
end


return theme
