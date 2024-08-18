vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('config.globals')

require('config.plugins')

require('config.options')
require('config.functions')
require('config.commands')
require('config.keymaps')
require('config.autocommands')
require('config.filetypes')

require('config.lsp')
require('config.gdb')

vim.cmd.colorscheme('ese')

