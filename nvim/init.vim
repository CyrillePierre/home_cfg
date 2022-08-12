set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

tnoremap <esc> <c-\><c-n>
tnoremap <silent> <c-left>   <c-\><c-n><c-w>h
tnoremap <silent> <c-right>  <c-\><c-n><c-w>l
tnoremap <silent> <c-down>   <c-\><c-n><c-w>j
tnoremap <silent> <c-up>     <c-\><c-n><c-w>k
tnoremap <silent> <s-c-left>  <c-\><c-n>:bN<cr>
tnoremap <silent> <s-c-right> <c-\><c-n>:bn<cr>
