" Vim color file
" Maintainer: Cyrille Pierre <cypierre58@gmail.com>
" Last Change:  2024 Mars 05

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "ese"

" Console
highlight Normal       ctermfg=223       ctermbg=234                   guifg=#FFD7AF  guibg=#1C1C1C
highlight Search       ctermfg=232       ctermbg=179      cterm=none   guifg=#080808  guibg=#D7AF5F  gui=none
highlight Cursor       ctermfg=Black     ctermbg=Green    cterm=bold   guifg=#FF0000  guibg=#00FF00  gui=bold
highlight Comment      ctermfg=102                                     guifg=#878787
" highlight StatusLine   ctermfg=Brown     ctermbg=black
highlight Statement    ctermfg=214                                     guifg=#FFAF00
highlight Type         ctermfg=214                                     guifg=#FFAF00
highlight Constant     ctermfg=148                                     guifg=#D7AF5F
highlight Identifier   ctermfg=223                        cterm=none   guifg=#FFD7AF                 gui=none
highlight Folded       ctermfg=250       ctermbg=233                   guifg=#BCBCBC  guibg=#121212
highlight CursorLine                     ctermbg=237      cterm=none                  guibg=#3A3A3A  gui=none
highlight PreProc      ctermfg=172                                     guifg=#D78700
highlight SpellBad                       ctermbg=52                                   guibg=#5F0000
highlight SpellCap                       ctermbg=232      cterm=none                  guibg=#080808  gui=none
highlight Operator     ctermfg=203                                     guifg=#FF5F5F
highlight Special      ctermfg=179                                     guifg=#D7AF5F
highlight Visual                         ctermbg=240                                  guibg=#585858
highlight Error        ctermfg=254       ctermbg=52                    guifg=#E4E4E4  guibg=#5F0000
highlight Pmenu        ctermfg=252       ctermbg=23                    guifg=#D0D0D0  guibg=#005F5F
highlight Pmenusel     ctermfg=254       ctermbg=29                    guifg=#E4E4E4  guibg=#00875F
highlight SpecialKey   ctermfg=72                                      guifg=#5FAF87
highlight Directory    ctermfg=72                                      guifg=#5FAF87
highlight Todo         ctermfg=237       ctermbg=179                   guifg=#3A3A3A  guibg=#D7AF5F
highlight WildMenu     ctermfg=0         ctermbg=248                                  guibg=#A8A8A8
highlight OverLength                     ctermbg=53                                   guibg=#5F005F
highlight ColorColumn                    ctermbg=235                                  guibg=#262626Nov
highlight MatchParen   ctermfg=79        ctermbg=none     cterm=bold   guifg=#5FD7AF  guibg=none     gui=bold
highlight Title        ctermfg=172                                     guifg=#D78700
highlight CursorColumn                   ctermbg=237                                  guibg=#3A3A3A
highlight VertSplit                                       cterm=none                                 gui=none
highlight SignColumn                     ctermbg=none                                 guibg=none

" highlight YCMInverse ctermfg=15

highlight LspErrorHighlight                                   cterm=underline                        gui=underline
highlight LspWarningHighlight                                 cterm=underline                        gui=underline
highlight LspInformationHighlight                             cterm=underline                        gui=underline
highlight LspErrorText              ctermfg=203   ctermbg=16  cterm=none                             gui=none
highlight LspWarningText            ctermfg=213   ctermbg=16  cterm=none                             gui=none
highlight LspInformationText        ctermfg=153   ctermbg=16  cterm=none                             gui=none
highlight LspHintText               ctermfg=153   ctermbg=16  cterm=none                             gui=none
highlight link LspErrorVirtualText LspErrorText
highlight link LspWarningVirtualText LspWarningText
highlight link LspInformationVirtualText LspInformationText
highlight link LspHintVirtualText LspHintText
highlight link LspCodeActionText Normal

"{{{ cfy "
highlight DiffAdd           ctermfg=512       ctermbg=22      cterm=none              guifg=#000000   guibg=#005F00   gui=none
highlight DiffDelete        ctermfg=darkblue  ctermbg=black   cterm=none              guifg=darkblue  guibg=#000000   gui=none
highlight DiffChange        ctermfg=251       ctermbg=166     cterm=none              guifg=#C6C6C6   guibg=#D75F00   gui=none

highlight GitGutterAdd      ctermfg=22        ctermbg=none    cterm=none              guifg=#005F00   guibg=NONE      gui=none
highlight GitGutterChange   ctermfg=166       ctermbg=none    cterm=none              guifg=#D75F00   guibg=NONE      gui=none
highlight GitGutterDelete   ctermfg=darkred   ctermbg=none    cterm=none              guifg=darkred   guibg=NONE      gui=none

highlight default link Overlength ColorColumn
"}}}

"{{{ LSP "
highlight LspErrorHighlight                                   cterm=underline                                         gui=underline
highlight LspWarningHighlight                                 cterm=underline                                         gui=underline
highlight LspInformationHighlight                             cterm=underline                                         gui=underline
highlight LspErrorText            ctermfg=203 ctermbg=234     cterm=none              guifg=#FF5F5F   guibg=#1C1C1C   gui=none
highlight LspWarningText          ctermfg=213 ctermbg=16      cterm=none              guifg=#FF87FF   guibg=#000000   gui=none
highlight LspInformationText      ctermfg=153 ctermbg=16      cterm=none              guifg=#AFD7FF   guibg=#000000   gui=none
highlight LspHintText             ctermfg=153 ctermbg=16      cterm=none              guifg=#AFD7FF   guibg=#000000   gui=none
"}}}
" 
"{{{ Doxygen "
let g:load_doxygen_syntax = 1

highlight doxygenComment    ctermfg=blue      ctermbg=none    cterm=none              guifg=blue      guibg=NONE      gui=none
highlight doxygenBrief      ctermfg=darkblue  ctermbg=none    cterm=none              guifg=darkblue  guibg=NONE      gui=none
highlight doxygenParamName  ctermfg=darkgray  ctermbg=none    cterm=underline         guifg=darkgray  guibg=NONE      gui=none

highlight default link doxygenSpecialOnelineDesc doxygenBrief
"}}}

" doautoall syntaxset FileType
