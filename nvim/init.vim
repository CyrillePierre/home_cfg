set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if has('nvim'):
tnoremap <esc> <c-\><c-n>
tnoremap <c-left> <c-\><c-n><c-w>h:AirlineRefresh<cr>
tnoremap <c-right> <c-\><c-n><c-w>l:AirlineRefresh<cr>
tnoremap <s-c-left> <c-\><c-n>:bN<cr>
tnoremap <s-c-right> <c-\><c-n>:bn<cr>
