" Vim color file
" Maintainer:	Cyrille Pierre <cypierre58@gmail.com>
" Last Change:	2020 Nov 07

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "ese_light"

" Console
highlight Normal           ctermfg=232        ctermbg=White
highlight Search           ctermfg=232        ctermbg=248	  cterm=NONE
highlight Cursor           ctermfg=Black	  ctermbg=Green	  cterm=bold
highlight Special          ctermfg=166
highlight Comment          ctermfg=59
highlight StatusLine       ctermfg=232	      ctermbg=245     term=none cterm=none
highlight Statement        ctermfg=89
highlight Type		       ctermfg=88                         term=none cterm=none
highlight Constant	       ctermfg=22
highlight Identifier       ctermfg=54                         term=none cterm=none
highlight Folded           ctermfg=234       ctermbg=250
highlight CursorLine                         ctermbg=252      cterm=NONE
highlight PreProc          ctermfg=130
highlight SpellBad                           ctermbg=209      cterm=NONE
highlight SpellCap                           ctermbg=213      cterm=NONE
highlight SignColumn                         ctermbg=0
highlight Operator         ctermfg=52
highlight Visual                             ctermbg=253
highlight Error            ctermfg=52        ctermbg=209
highlight Pmenu            ctermfg=232       ctermbg=253
highlight Pmenusel         ctermfg=252       ctermbg=23
highlight SpecialKey       ctermfg=29
highlight Directory        ctermfg=24
highlight Todo             ctermfg=237       ctermbg=179
highlight OverLength                         ctermbg=213
highlight VertSplit                          ctermbg=253      term=none cterm=none
highlight StatusLine                         ctermbg=253      term=none cterm=none
highlight StatusLineNC                       ctermbg=253      term=none cterm=none
highlight StatusLineTerm                     ctermbg=253      term=none cterm=none
highlight StatusLineTermNC                   ctermbg=253      term=bold cterm=bold
highlight SignColumn       ctermfg=245       ctermbg=White
highlight ColorColumn                        ctermbg=254
