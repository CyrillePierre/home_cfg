""""""""""""" Variables """"""""""""""""""""""
let g:nvimgdb_disable_start_keymaps = 1

""""""""""""" Functions """"""""""""""""""""""
function! GdbNextCount(n)
	call luaeval("NvimGdb.i():send('n ".a:n."')")
endfunction
function! GdbStepCount(n)
	call luaeval("NvimGdb.i():send('s ".a:n."')")
endfunction
function! GdbFrameUpCount(n)
	call luaeval("NvimGdb.i():send('up ".a:n."')")
endfunction
function! GdbFrameDownCount(n)
	call luaeval("NvimGdb.i():send('down ".a:n."')")
endfunction
function! GdbAgain()
	call luaeval("NvimGdb.i():send('')")
endfunction

""""""""""""" Mapping """"""""""""""""""""""""
nnoremap <leader>DD :GdbStart gdb -q<Space>
nnoremap <leader>DL :GdbStartLLDB lldb
nnoremap <leader>DP :GdbStartPDB python -m pdb main.py
nnoremap <leader>DP :GdbStartBashDB bashdb main.sh
nnoremap <leader>DR :GdbStartRR

augroup nvimgdb_initvim
	au!

	au User NvimGdbStart nnoremap <silent> <leader>Db :GdbLopenBreakpoints<CR>
	au User NvimGdbStart nnoremap <silent> <leader>Dt :GdbLopenBacktrace<CR>

	au User NvimGdbStart nnoremap <silent> <leader>dB :GdbBreakpointClearAll<CR>
	au User NvimGdbStart nnoremap <silent> <leader>db :GdbBreakpointToggle<CR>
	au User NvimGdbStart nnoremap <silent> <leader>dc :GdbContinue<CR>
	au User NvimGdbStart nnoremap <leader>dw :GdbCreateWatch<Space>
	au User NvimGdbStart nnoremap <silent> <leader>d, :GdbEvalWord<CR>
	au User NvimGdbStart vnoremap <silent> <leader>d, :GdbEvalRange<CR>
	au User NvimGdbStart nnoremap <silent> <leader>df :GdbFinish<CR>
	au User NvimGdbStart nnoremap <silent> <leader>dF :GdbFrame<CR>
	au User NvimGdbStart nnoremap <silent> <leader>dj :call GdbFrameDownCount(v:count1)<CR>
	au User NvimGdbStart nnoremap <silent> <leader>dk :call GdbFrameUpCount(v:count1)<CR>
	au User NvimGdbStart nnoremap <silent> <leader>dn :call GdbNextCount(v:count1)<CR>
	au User NvimGdbStart nnoremap <leader>dr :Gdb run<Space>
	au User NvimGdbStart nnoremap <leader>dS :Gdb start<Space>
	au User NvimGdbStart nnoremap <silent> <leader>ds :call GdbStepCount(v:count1)<CR>
	au User NvimGdbStart nnoremap <silent> <leader>d<Space> :call GdbAgain()<CR>

	au User NvimGdbCleanup nunmap <leader>Db
	au User NvimGdbCleanup nunmap <leader>Dt

	au User NvimGdbCleanup nunmap <leader>dB
	au User NvimGdbCleanup nunmap <leader>db
	au User NvimGdbCleanup nunmap <leader>dc
	au User NvimGdbCleanup nunmap <leader>dw
	au User NvimGdbCleanup nunmap <leader>d,
	au User NvimGdbCleanup vunmap <leader>d,
	au User NvimGdbCleanup nunmap <leader>df
	au User NvimGdbCleanup nunmap <leader>dF
	au User NvimGdbCleanup nunmap <leader>dj
	au User NvimGdbCleanup nunmap <leader>dk
	au User NvimGdbCleanup nunmap <leader>dn
	au User NvimGdbCleanup nunmap <leader>dr
	au User NvimGdbCleanup nunmap <leader>dS
	au User NvimGdbCleanup nunmap <leader>ds
	au User NvimGdbCleanup nunmap <leader>d<Space>
augroup END
