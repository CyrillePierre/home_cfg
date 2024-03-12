function AutoNeoTree()
	local function get_listed_buffers()
		local buffers = {}
		for buffer = 1, vim.fn.bufnr('$') do
			if vim.fn.buflisted(buffer) ~= 0 then
				buffers[#buffers+1] = buffer
			end
		end
		return buffers
	end

	vim.cmd.Neotree()
	local buffers = get_listed_buffers()

	for _, buf in pairs(buffers) do
		vim.cmd.Neotree('reveal_file=' .. vim.fn.bufname(buf))
	end
	vim.cmd.wincmd('p')
	vim.cmd.Neotree('reveal')
	vim.cmd.wincmd('p')
end

function AddHeaderGuards()
	local line = vim.fn.getline(1)
	if line == '#pragma once' then
		print('There is already a #pragma once')
		return 0
	end

	local function startswith(str, pattern)
		return str:sub(1, pattern:len()) == pattern
	end

	if startswith(line, '#ifndef') then
		print('It seems there are already guards')
		return 0
	end

	local srcdir = 'src'
	local file = vim.fn.expand('%')

	while startswith(file, srcdir .. '/') do
		file = vim.fn.fnamemodify(file, ':s?' .. srcdir .. '/??')
	end

	local project_name = vim.fn.fnamemodify(vim.fn.ProjectRoot(), ':t')
	local guard = vim.fn.toupper(project_name .. '_' .. vim.fn.substitute(file, '[./]', '_', 'g'))
	vim.api.nvim_buf_set_lines(0, 0, 0, false, {'#ifndef ' .. guard, '#define ' .. guard, ''})
	vim.api.nvim_buf_set_lines(0, -1, -1, false, {'', '#endif'})
end

function ToggleRightMargin(opts)
	if #opts.fargs == 0 or vim.o.colorcolumn == opts.fargs[1] then
		vim.o.colorcolumn = ''
		vim.cmd.match('Overlength //')
	else
		vim.opt.colorcolumn = opts.fargs[1]
		vim.cmd.match('Overlength /.\\%>' .. vim.o.colorcolumn .. 'v/')
	end
end

function FoldMarkerText()
	local text = vim.fn.getline(vim.v.foldstart+1)
	local info = vim.fn.getline(vim.v.foldstart)
	info = vim.fn.substitute(info , '^.*{{{[ "]*\\(.*\\)$', '\\1', '') -- }}}

	if info:len() ~= 0 then
		local rev_info = vim.fn.join(vim.fn.reverse(vim.fn.split(info, '.\\zs')), '')
		local idata    = vim.fn.substitute(rev_info, '^[ "]*\\(.*\\)$', '\\1', '')
		idata = vim.fn.join(vim.fn.reverse(vim.fn.split(idata, '.\\zs')), '')
		if idata:len() ~= 0 then
			if rev_info:sub(1, 1) == '"' then
				text = idata
			else
				text = text .. ' (' .. idata .. ')'
			end
		end
	end
	if text:len() == 0 then
		text = ' ' .. (vim.v.foldend-vim.v.foldstart) .. ' lines'
	end

	return vim.v.folddashes .. ' ' .. text .. ' '
end

function ToggleGitGutter()
	vim.cmd.GitGutterLineHighlightsToggle()
	vim.cmd.GitGutterSignsToggle()
end

vim.g.autofoldtoggle = ''
function AutoFoldToggle()
	if vim.g.autofoldtoggle ~= '' then
		vim.opt.foldclose = ''
		vim.opt.foldopen = 'block,hor,mark,percent,quickfix,search,tag,undo'
		vim.o.foldlevelstart = vim.g.oldfoldlevelstart
		vim.cmd.windo('let &foldlevel=20')
		vim.g.autofoldtoggle = ''
	else
		vim.opt.foldclose = 'all'
		vim.opt.foldopen = 'all'
		vim.g.oldfoldlevelstart = vim.o.foldlevelstart
		vim.opt.foldlevelstart = 0
		vim.cmd.windo('set foldlevel=0')
		vim.g.autofoldtoggle = 'active'
	end
end

function GpSetAPIKey(opts)
	require('gp').setup{openai_api_key = opts.fargs[1]}
end