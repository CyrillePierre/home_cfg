vim.g.nvimgdb_disable_start_keymaps = 1

function GdbNextCount(n)
	NvimGdb.i():send('n ' .. n)
end
function GdbStepCount(n)
	NvimGdb.i():send('s ' .. n)
end
function GdbFrameUpCount(n)
	NvimGdb.i():send('up ' .. n)
end
function GdbFrameDownCount(n)
	NvimGdb.i():send('down ' .. n)
end
function GdbFrameDownCount(n)
	NvimGdb.i():send('up ' .. n)
end
function GdbAgain()
	NvimGdb.i():send('')
end

vim.keymap.set('n', '<leader>DD', ':GdbStart gdb -q<Space>')
vim.keymap.set('n', '<leader>DL', ':GdbStartLLDB lldb')
vim.keymap.set('n', '<leader>DP', ':GdbStartPDB python -m pdb<Space>')
vim.keymap.set('n', '<leader>DB', ':GdbStartBashDB bashdb<Space>')
vim.keymap.set('n', '<leader>DR', ':GdbStartRR')

function GdbSetupCommand()
	vim.keymap.set('n', '<leader>Db', vim.cmd.GdbLopenBreakpoints, {silent = true})
	vim.keymap.set('n', '<leader>Dt', vim.cmd.GdbLopenBacktrace, {silent = true})

	vim.keymap.set('n', '<leader>dB', vim.cmd.GdbBreakpointClearAll, {silent = true})
	vim.keymap.set('n', '<leader>db', vim.cmd.GdbBreakpointToggle, {silent = true})
	vim.keymap.set('n', '<leader>dc', vim.cmd.GdbContinue, {silent = true})
	vim.keymap.set('n', '<leader>dw', ':GdbCreateWatch<Space>')
	vim.keymap.set('n', '<leader>d,', vim.cmd.GdbEvalWord, {silent = true})
	vim.keymap.set('v', '<leader>d,', vim.cmd.GdbEvalRange, {silent = true})
	vim.keymap.set('v', '<leader>df', vim.cmd.GdbFinish, {silent = true})
	vim.keymap.set('v', '<leader>dF', vim.cmd.GdbFrame, {silent = true})
	vim.keymap.set('v', '<leader>dj', ':call GdbFrameDownCount(v:count1)<CR>', {silent = true})
	vim.keymap.set('v', '<leader>dk', ':call GdbFrameUpCount(v:count1)<CR>', {silent = true})
	vim.keymap.set('v', '<leader>dn', ':call GdbNextCount(v:count1)<CR>', {silent = true})
	vim.keymap.set('n', '<leader>dr', ':Gdb run<Space>')
	vim.keymap.set('n', '<leader>dS', ':Gdb start<Space>')
	vim.keymap.set('v', '<leader>ds', ':call GdbStepCount(v:count1)<CR>', {silent = true})
	vim.keymap.set('v', '<leader>d<Space>', ':call GdbAgain()<CR>', {silent = true})
end

function GdbCleanupCommand()
	vim.keymap.del('n', '<leader>Db')
	vim.keymap.del('n', '<leader>Dt')

	vim.keymap.del('n', '<leader>dB')
	vim.keymap.del('n', '<leader>db')
	vim.keymap.del('n', '<leader>dc')
	vim.keymap.del('n', '<leader>dw')
	vim.keymap.del('n', '<leader>d,')
	vim.keymap.del('v', '<leader>d,')
	vim.keymap.del('v', '<leader>df')
	vim.keymap.del('v', '<leader>dF')
	vim.keymap.del('v', '<leader>dj')
	vim.keymap.del('v', '<leader>dk')
	vim.keymap.del('v', '<leader>dn')
	vim.keymap.del('n', '<leader>dr')
	vim.keymap.del('n', '<leader>dS')
	vim.keymap.del('v', '<leader>ds')
	vim.keymap.del('v', '<leader>d<Space>')
end

local autogroup_gdb = vim.api.nvim_create_augroup('gdb', {clear = true})
vim.api.nvim_create_autocmd({'User'}, {
	pattern = 'NvimGdbStart',
	group = autogroup_gdb,
	callback = GdbSetupCommand,
})
vim.api.nvim_create_autocmd({'User'}, {
	pattern = 'NvimGdbCleanup',
	group = autogroup_gdb,
	callback = GdbCleanupCommand,
})
