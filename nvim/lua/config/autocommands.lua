local init_lua = vim.api.nvim_create_augroup('init_lua', {clear = false})
vim.api.nvim_create_autocmd({'BufReadPre'}, {
	pattern = '*',
	group = init_lua,
	command = 'if getfsize(expand("<afile>")) | set noswapfile | endif',
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*',
	group = init_lua,
	command = 'CccHighlighterEnable',
})
vim.api.nvim_create_autocmd({'TermOpen'}, {
	pattern = '*',
	group = init_lua,
	command = 'startinsert',
})
vim.api.nvim_create_autocmd({'FocusGained'}, {
	pattern = '*',
	group = init_lua,
	command = 'set mouse=nv',
})
vim.api.nvim_create_autocmd({'FocusLost'}, {
	pattern = '*',
	group = init_lua,
	command = 'set mouse=',
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = 'changelog,CHANGELOG',
	group = init_lua,
	command = 'setlocal expandtab',
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*.vim,.vimrc,vimrc,*.tex,*.lua',
	group = init_lua,
	command = 'set foldmethod=marker foldtext=v:lua.FoldMarkerText()',
})
vim.api.nvim_create_autocmd({'BufReadPost'}, {
	pattern = '*',
	group = init_lua,
	command = 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | endif',
})
-- vim.api.nvim_create_autocmd({'VimEnter'}, {
-- pattern = '*',
-- group = init_lua,
-- command = 'call timer_start(0, { tid -> :lua SetupVimAS() })',
-- })

local autogroup_cpp = vim.api.nvim_create_augroup('cpp', {clear = false})
vim.api.nvim_create_autocmd({'BufWritePre'}, {
	pattern = '*.cpp,*.cc,*.c,*.hpp,*.hh,*.h',
	group = autogroup_cpp,
	command = '%s/\\s\\+$//e',
})

local autogroup_tex = vim.api.nvim_create_augroup('tex', {clear = false})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*.tex',
	group = autogroup_tex,
	command = 'let g:vimmake_options="-j1"'
	..     ' | call TexNewMathZone("align", "align", 1)'
	..     ' | call TexNewMathZone("equation", "equation", 1)'
	..     ' | call TexNewMathZone("gather", "gather", 1)'
	..     ' | call TexNewMathZone("multiline", "multiline", 1)',
})
-- vim.api.nvim_create_autocmd({'BufWritePost'}, {
-- 	pattern = '*.tex',
-- 	group = autogroup_tex,
-- 	command = 'MakeAsync!',
-- })

local autogroup_md = vim.api.nvim_create_augroup('md', {clear = false})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*.md',
	group = autogroup_md,
	command = 'syn match admonishTag "%%.*"'
	..     ' | syn cluster mkdNonListItem add=admonishTag'
	..     ' | hi def link admonishTag Constant',
})
