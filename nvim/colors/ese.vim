" Vim color file
" Maintainer: Cyrille Pierre <cypierre58@gmail.com>
" Last Change:  2020 Nov 07

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "ese"
let g:airline_theme='ese'

" Console
highlight Normal       ctermfg=223       ctermbg=234
highlight Search       ctermfg=232       ctermbg=179      cterm=none
highlight Cursor       ctermfg=Black     ctermbg=Green    cterm=bold
highlight Comment      ctermfg=102
highlight StatusLine   ctermfg=Brown     ctermbg=black
highlight Statement    ctermfg=214
highlight Type         ctermfg=214
highlight Constant     ctermfg=148
highlight Identifier   ctermfg=223                        cterm=none
highlight Folded       ctermfg=250       ctermbg=233
highlight CursorLine                     ctermbg=237      cterm=none
highlight PreProc      ctermfg=172
highlight SpellBad                       ctermbg=52
highlight SpellCap                       ctermbg=232      cterm=none
highlight SignColumn                     ctermbg=0
highlight Operator     ctermfg=203
highlight Special      ctermfg=179
highlight Visual                         ctermbg=240
highlight Error        ctermfg=254       ctermbg=52
highlight Pmenu        ctermfg=252       ctermbg=23
highlight Pmenusel     ctermfg=254       ctermbg=29
highlight SpecialKey   ctermfg=72
highlight Directory    ctermfg=72
highlight Todo         ctermfg=237       ctermbg=179
highlight WildMenu     ctermfg=0         ctermbg=248
highlight OverLength                     ctermbg=53
highlight ColorColumn                    ctermbg=235
highlight MatchParen   ctermfg=79        ctermbg=none     cterm=bold
highlight Title        ctermfg=172
highlight CursorColumn                   ctermbg=237
highlight VertSplit                                       cterm=none
highlight SignColumn                     ctermbg=none

highlight YCMInverse ctermfg=15

highlight LspErrorHighlight                                   cterm=underline
highlight LspWarningHighlight                                 cterm=underline
highlight LspInformationHighlight                             cterm=underline
highlight LspErrorText              ctermfg=203   ctermbg=16  cterm=none
highlight LspWarningText            ctermfg=213   ctermbg=16  cterm=none
highlight LspInformationText        ctermfg=153   ctermbg=16  cterm=none
highlight LspHintText               ctermfg=153   ctermbg=16  cterm=none
highlight link LspErrorVirtualText LspErrorText
highlight link LspWarningVirtualText LspWarningText
highlight link LspInformationVirtualText LspInformationText
highlight link LspHintVirtualText LspHintText
highlight link LspCodeActionText Normal

doautoall syntaxset FileType
