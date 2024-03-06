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
" highlight Normal      ctermfg=232  ctermbg=231                guifg=#000000  guibg=#ffffff
highlight Normal      ctermfg=232  ctermbg=231                guifg=2  guibg=255
highlight Search      ctermfg=232  ctermbg=248    cterm=none  guifg=#080808
highlight Special     ctermfg=130                             
highlight Comment     ctermfg=59                              
highlight StatusLine  ctermfg=232	 ctermbg=245    cterm=none  guifg=#080808
highlight Statement   ctermfg=89                              
highlight Type		    ctermfg=88                  cterm=none  
highlight Constant	  ctermfg=22                             
highlight Identifier  ctermfg=54                  cterm=none 
highlight Folded      ctermfg=234  ctermbg=250                
highlight CursorLine               ctermbg=252    cterm=none  
highlight PreProc     ctermfg=130                             
highlight SpellBad                 ctermbg=209    cterm=none  
highlight SpellCap                 ctermbg=225    cterm=none  
highlight SignColumn               ctermbg=0                  
highlight Operator    ctermfg=52                              
highlight Visual                   ctermbg=253                
highlight Error       ctermfg=52   ctermbg=209                
highlight Pmenu       ctermfg=232  ctermbg=253                guifg=#080808
highlight Pmenusel    ctermfg=252  ctermbg=23                
highlight SpecialKey  ctermfg=29                              
highlight Directory   ctermfg=24                              
highlight Todo        ctermfg=237  ctermbg=179                
highlight OverLength               ctermbg=213                
highlight VertSplit                ctermbg=253    cterm=none  
highlight SignColumn  ctermfg=245  ctermbg=White              
highlight ColorColumn              ctermbg=254                

highlight StatusLine               ctermbg=253      cterm=none
highlight StatusLineNC             ctermbg=253      cterm=none
highlight StatusLineTerm           ctermbg=253      cterm=none
highlight StatusLineTermNC         ctermbg=253      cterm=bold

highlight LspErrorHighlight                                   cterm=underline
highlight LspWarningHighlight                                 cterm=underline
highlight LspInformationHighlight                             cterm=underline
highlight LspErrorText              ctermfg=52   ctermbg=224  cterm=none
highlight LspWarningText            ctermfg=53   ctermbg=225  cterm=none
highlight LspInformationText        ctermfg=20   ctermbg=223  cterm=none
highlight LspHintText               ctermfg=94   ctermbg=188  cterm=none

highlight link LspErrorVirtualText LspErrorText
highlight link LspWarningVirtualText LspWarningText
highlight link LspInformationVirtualText LspInformationText
highlight link LspHintVirtualText LspHintText
highlight link LspCodeActionText Normal

" doautoall syntaxset FileType
