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
let g:airline_theme='google_light'

" Console
highlight Normal      ctermfg=232  ctermbg=231                guifg=#000000  guibg=#ffffff
highlight Search      ctermfg=232  ctermbg=248    cterm=none  guifg=#000000  guibg=#a8a8a8  gui=none
highlight Special     ctermfg=130                             guifg=#af5f00
highlight Comment     ctermfg=59                              guifg=#5f5f5f
highlight StatusLine  ctermfg=232	 ctermbg=245    cterm=none  guifg=#000000  guibg=#8a8a8a  gui=none
highlight Statement   ctermfg=89                              guifg=#87005f
highlight Type		    ctermfg=88                  cterm=none  guifg=#870000  guibg=#ffffff  gui=none
highlight Constant	  ctermfg=22                              guifg=#007f00
highlight Identifier  ctermfg=54                  cterm=none  guifg=#5f0087                 gui=none
highlight Folded      ctermfg=234  ctermbg=250                guifg=#1c1c1c  guibg=#bcbcbc
highlight CursorLine               ctermbg=252    cterm=none                 guibg=#ffffff  gui=none
highlight PreProc     ctermfg=130                             guifg=#af5f00
highlight SpellBad                 ctermbg=209    cterm=none                 guibg=#ff875f  gui=none
highlight SpellCap                 ctermbg=225    cterm=none                 guibg=#ffd7ff  gui=none
highlight SignColumn               ctermbg=0                                 guibg=#000000
highlight Operator    ctermfg=52                              guifg=#5f0000
highlight Visual                   ctermbg=253                               guibg=#dadada
highlight Error       ctermfg=52   ctermbg=209                guifg=#5f0000  guibg=#ff875f
highlight Pmenu       ctermfg=232  ctermbg=253                guifg=#080808  guibg=#dadada
highlight Pmenusel    ctermfg=252  ctermbg=23                 guifg=#d0d0d0  guibg=#005f5f
highlight SpecialKey  ctermfg=29                              guifg=#00875f
highlight Directory   ctermfg=24                              guifg=#005f87
highlight Todo        ctermfg=237  ctermbg=179                guifg=#3a3a3a  guibg=#d7af5f
highlight OverLength               ctermbg=213                               guibg=#ff87ff
highlight VertSplit                ctermbg=253    cterm=none                 guibg=#dadada  gui=none
highlight SignColumn  ctermfg=245  ctermbg=White              guifg=#8a8a8a  guibg=#ffffff
highlight ColorColumn              ctermbg=254                               guibg=#e4e4e4

highlight StatusLine               ctermbg=253      cterm=none
highlight StatusLineNC             ctermbg=253      cterm=none
highlight StatusLineTerm           ctermbg=253      cterm=none
highlight StatusLineTermNC         ctermbg=253      cterm=bold

highlight LspErrorHighlight                                   cterm=underline                                gui=underline
highlight LspWarningHighlight                                 cterm=underline                                gui=underline
highlight LspInformationHighlight                             cterm=underline                                gui=underline
highlight LspErrorText              ctermfg=52   ctermbg=224  cterm=none       guifg=#5f0000  guibg=#ffd7d7  gui=none
highlight LspWarningText            ctermfg=53   ctermbg=225  cterm=none       guifg=#5f005f  guibg=#ffd7ff  gui=none
highlight LspInformationText        ctermfg=20   ctermbg=223  cterm=none       guifg=#0000d7  guibg=#ffd7af  gui=none
highlight LspHintText               ctermfg=94   ctermbg=188  cterm=none       guifg=#875f00  guibg=#d7d7d7  gui=none

highlight link LspErrorVirtualText LspErrorText
highlight link LspWarningVirtualText LspWarningText
highlight link LspInformationVirtualText LspInformationText
highlight link LspHintVirtualText LspHintText
highlight link LspCodeActionText Normal

" doautoall syntaxset FileType
