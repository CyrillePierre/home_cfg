local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local lazyurl = 'https://github.com/folke/lazy.nvim.git'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system{'git', 'clone', '--filter=blob:none', lazyurl, '--branch=stable', lazypath}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
