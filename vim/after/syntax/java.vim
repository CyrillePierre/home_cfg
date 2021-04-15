
" couleur des caractère spéciaux :
syn match CaracSpec "[{}()\[\]|<>*+^/,.;:!?%&~=-]"
highlight link CaracSpec Special

" il faut refaire les commentaires :
syn region Com start="/\*" end="\*/"
syn match Com1 "//.*"
highlight link Com1 Com
highlight link Com Comment
