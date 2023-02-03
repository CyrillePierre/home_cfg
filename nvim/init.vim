set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

""""""""""""" Plugin config """"""""""""""""""
source ~/.config/nvim/gdb.vim

""""""""""""" Fix configured settings """"""""
set undodir=~/.local/share/nvim/undo

""""""""""""" Mapping """"""""""""""""""""""""
tnoremap <esc> <c-\><c-n>
tnoremap <silent> <c-left>   <c-\><c-n><c-w>h
tnoremap <silent> <c-right>  <c-\><c-n><c-w>l
tnoremap <silent> <c-down>   <c-\><c-n><c-w>j
tnoremap <silent> <c-up>     <c-\><c-n><c-w>k
tnoremap <silent> <s-c-left>  <c-\><c-n>:bN<cr>
tnoremap <silent> <s-c-right> <c-\><c-n>:bn<cr>

nmap <leader>f :Neoformat<cr>

" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.c,*.cpp,*.h,*.hpp undojoin | Neoformat
" augroup END
