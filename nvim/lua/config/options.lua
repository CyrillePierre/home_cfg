vim.opt.matchpairs:append('<:>')
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 20

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.history = 10000

vim.opt.swapfile = true

vim.opt.title = true
vim.opt.titlestring = ''
vim.opt.titleold = ''

vim.opt.winminwidth = 20
vim.opt.winwidth = 120

vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.listchars = {eol = '$', tab = '>-', trail = '#'}
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.o.cinoptions = ':0,(0,Ws,m1,N-s,E-s,g0,hs'

vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.backspace = 'indent,eol,start'

vim.opt.completeopt = 'menu,preview,noselect'
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'

vim.o.sessionoptions='buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

vim.opt.termguicolors = true
