" Vim color file
" Maintainer:	Cyrille Pierre <cypierre58@gmail.com>
" Last Change:	2020 Nov 07

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "ese2"

" Console
highlight Normal      ctermfg=223       ctermbg=234
highlight Search      ctermfg=232	    ctermbg=179	    cterm=NONE
highlight Cursor      ctermfg=Black	    ctermbg=Green	cterm=bold
highlight Comment     ctermfg=102
highlight StatusLine  ctermfg=Brown	    ctermbg=black
highlight Statement   ctermfg=214
highlight Type		  ctermfg=214
highlight Constant	  ctermfg=148
highlight Identifier  ctermfg=223                        cterm=NONE
highlight Folded      ctermfg=250       ctermbg=233
highlight CursorLine                    ctermbg=237      cterm=NONE
highlight PreProc     ctermfg=172
highlight SpellBad                      ctermbg=52
highlight SpellCap                      ctermbg=232     cterm=none
highlight SignColumn                    ctermbg=0
highlight Operator    ctermfg=203
highlight Special     ctermfg=179
highlight Visual                        ctermbg=238
highlight Error       ctermfg=254       ctermbg=52
highlight Pmenu       ctermfg=232       ctermbg=65
highlight Pmenusel    ctermfg=252       ctermbg=23
highlight SpecialKey  ctermfg=72
highlight Directory   ctermfg=72
highlight Todo        ctermfg=237       ctermbg=179
highlight WildMenu    ctermfg=0         ctermbg=248
highlight OverLength                    ctermbg=53
highlight ColorColumn                   ctermbg=235
highlight MatchParen  ctermfg=232       ctermbg=79

highlight YCMInverse ctermfg=15
