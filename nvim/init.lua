vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.cmd.colorscheme('cfy')

require('config.globals')

require('config.plugins')

require('config.options')
require('config.functions')
require('config.commands')
require('config.keymaps')
require('config.autocommands')

require('config.statusline')
require('config.lsp')
require('config.gdb')

require('config.setup')
