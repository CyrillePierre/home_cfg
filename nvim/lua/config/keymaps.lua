vim.keymap.set('n', 'QQ', ':qa<CR>', {silent = true})
vim.keymap.set('n', '<leader>l', ':set number! relativenumber!<CR>', {silent = true})
vim.keymap.set('n', '<leader><CR>', '<C-]>', {silent = true})
vim.keymap.set('n', '<leader><Backspace>', '<C-T>', {silent = true})
vim.keymap.set('n', '<leader><Left>', '<C-^>', {silent = true})
vim.keymap.set('n', '<leader>w', ':noautocmd w<CR>', {silent = true})
vim.keymap.set('n', '<S-Tab>', '<C-d>', {silent = true})

vim.keymap.set('n', '<leader>z', ':setlocal spell spelllang=')
vim.keymap.set('n', '<leader>zn', '[s', {silent = true})
vim.keymap.set('n', '<leader>zp', ']s', {silent = true})
vim.keymap.set('n', '<leader>z<CR>', 'z=1<CR><CR>', {silent = true})

vim.keymap.set('n', '<leader><,', ':Neotree toggle<CR>', {silent = true})
vim.keymap.set('n', '<leader><<', ':Neotree reveal<CR>', {silent = true})
vim.keymap.set('n', '<leader><!', AutoNeoTree, {silent = true})
vim.keymap.set('n', '<leader><b', ':Neotree buffers<CR>', {silent = true})
vim.keymap.set('n', '<leader><<space>', ':Neotree float<CR>', {silent = true})

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {silent = true})

vim.keymap.set('n', '<C-b>', vim.cmd.Make)

vim.keymap.set('n', '<leader>za', ':let &foldlevel=&foldlevel+1<CR>', {silent = true})
vim.keymap.set('n', '<leader>zx', ':let &foldlevel=&foldlevel-1<CR>', {silent = true})
vim.keymap.set('n', '<leader>zz', ':let &foldlevel=0<CR>', {silent = true})
vim.keymap.set('n', '<leader>z,', AutoFoldToggle, {silent = true})

vim.keymap.set('n', '<C-Left>', '<C-W>h', {silent = true})
vim.keymap.set('n', '<C-Right>', '<C-W>l', {silent = true})
vim.keymap.set('n', '<C-Down>', '<C-W>j', {silent = true})
vim.keymap.set('n', '<C-Up>', '<C-W>k', {silent = true})

vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', {silent = true})
vim.keymap.set('n', '<leader>fF', ':FzfLua files resume=true<CR>', {silent = true})
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', {silent = true})
vim.keymap.set('n', '<leader>fg', ':FzfLua grep<CR>', {silent = true})
vim.keymap.set('n', '<leader>fwg', ':FzfLua grep_cword<CR>', {silent = true})
vim.keymap.set('n', '<leader>fG', ':FzfLua live_grep<CR>', {silent = true})
vim.keymap.set('v', '<leader>fg', ':<C-u>FzfLua grep_visual<CR>', {silent = true})
vim.keymap.set('n', '<leader>fl', ':FzfLua blines<CR>', {silent = true})
vim.keymap.set('n', '<leader>fL', ':FzfLua lines<CR>', {silent = true})
vim.keymap.set('n', '<leader>fj', ':FzfLua jumps<CR>', {silent = true})
vim.keymap.set('n', '<leader>fc', ':FzfLua git_bcommits<CR>', {silent = true})
vim.keymap.set('n', '<leader>fC', ':FzfLua git_commits<CR>', {silent = true})
vim.keymap.set('n', '<leader>fr', ':FzfLua lsp_references<CR>', {silent = true})
vim.keymap.set('n', '<leader>fi', ':FzfLua lsp_incoming_calls<CR>', {silent = true})
vim.keymap.set('n', '<leader>fo', ':FzfLua lsp_outgoing_calls<CR>', {silent = true})

vim.keymap.set('n', '<S-A-Left>', ':bN<CR>', {silent = true})
vim.keymap.set('i', '<S-A-Left>', '<Esc>:bN<CR>a', {silent = true})
vim.keymap.set('n', '<S-A-Right>', ':bn<CR>', {silent = true})
vim.keymap.set('i', '<S-A-Right>', '<Esc>:bn<CR>a', {silent = true})

vim.keymap.set('n', '<leader>q', ':BDelete hidden<CR>', {silent = true})
vim.keymap.set('n', '<leader>Q', ':BDelete other<CR>', {silent = true})

vim.keymap.set('i', '<Tab>', '<C-r>=CleverTabs(shiftwidth())<CR>', {silent = true})

vim.keymap.set('n', '<leader>hh', AddHeaderGuards, {silent = true})

vim.keymap.set('n', '<leader>am', '<C-u>Multiply<CR>', {silent = true})
vim.keymap.set('n', '<leader>ad', '<C-u>Divide<CR>', {silent = true})
vim.keymap.set('n', '<leader>ap', '<C-u>MultByPowerOf2<CR>', {silent = true})
vim.keymap.set('n', '<leader>ar', '<C-u>DivByPowerOf2<CR>', {silent = true})

vim.keymap.set('n', '<leader>vv', ':SynctexForward<CR>', {silent = true})
vim.keymap.set('n', '<leader>VV', ':SynctexForward!<CR>', {silent = true})

vim.keymap.set('n', '<leader>vG', vim.cmd.GitGutterSignsToggle, {silent = true})
vim.keymap.set('n', '<leader>vl', ToggleGitGutter, {silent = true})
vim.keymap.set('n', '<leader>vn', '<Plug>(GitGutterNextHunk)', {silent = true, remap = true})
vim.keymap.set('n', '<leader>vN', '<Plug>(GitGutterPrevHunk)', {silent = true, remap = true})
vim.keymap.set('n', '<leader>vf', vim.cmd.GitGutterFold, {silent = true})

vim.keymap.set('n', '<leader>vb', '<cmd>Gitsigns toggle_current_line_blame<CR>', {silent = true})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-Left>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-Down>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-Up>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-Right>', '<C-\\><C-n><C-w>l')

vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm, {silent = true})
vim.keymap.set('n', '<leader>t<CR>', vim.cmd.ToggleTermSendCurrentLine, {silent = true})
vim.keymap.set('v', '<leader>t<CR>', vim.cmd.ToggleTermSendVisualLines, {silent = true})
