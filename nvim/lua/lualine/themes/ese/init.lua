local background = vim.opt.background:get()
return require('lualine.themes.ese_' .. background .. '.init')
