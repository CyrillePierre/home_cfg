" Cfy's theme

highlight clear Normal
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "cfy"

"{{{ default "
highlight SpecialKey        ctermfg=4                                                 guifg=#3465A4
highlight NonText           ctermfg=12                                                guifg=#729FCF
highlight Directory         ctermfg=4                                                 guifg=#3465a4
highlight ErrorMsg          ctermfg=15        ctermbg=1                               guifg=#EEEEEC   guibg=#CC0000
highlight IncSearch                                           cterm=reverse                                           gui=reverse
highlight Search                              ctermbg=11                                              guibg=#FCE94F
highlight MoreMsg           ctermfg=2                                                 guifg=#4E9A06
highlight ModeMsg                                             cterm=bold                                              gui=bold
highlight LineNr            ctermfg=130                                               guifg=#AF5F00
highlight CursorLineNr      ctermfg=130                       cterm=underline         guifg=#AF5F00                   gui=underline
highlight Question          ctermfg=2                                                 guifg=#4E9A06
highlight StatusLine                                          cterm=bold,reverse                                      gui=bold,reverse
highlight StatusLineNC                                        cterm=reverse                                           gui=reverse
highlight VertSplit                                           cterm=reverse                                           gui=reverse
highlight Title             ctermfg=5                                                 guifg=#75507B                   gui=none
highlight Visual                              ctermbg=7                                               guibg=#D3D7CF
highlight VisualNOS                                           cterm=bold,underline                                    gui=bold,underline
highlight WarningMsg        ctermfg=1                                                 guifg=#CC0000
highlight WildMenu          ctermfg=0         ctermbg=11                              guifg=#2E3436   guibg=#FCE94F
highlight Folded            ctermfg=4         ctermbg=248                             guifg=#3465A4   guibg=#A8A8A8
highlight FoldColumn        ctermfg=4         ctermbg=248                             guifg=#3465A4   guibg=#A8A8A8
highlight DiffAdd                             ctermbg=81                                              guibg=#5FD7FF
highlight DiffChange                          ctermbg=225                                             guibg=#FFD7FF
highlight DiffDelete        ctermfg=12        ctermbg=159                             guifg=#729FCF   guibg=#AFFFFF
highlight DiffText                            ctermbg=9       cterm=bold                              guibg=#EF2929   gui=bold
highlight SignColumn        ctermfg=4         ctermbg=248                             guifg=#3465A4   guibg=#A8A8A8
highlight Conceal           ctermfg=7         ctermbg=242                             guifg=#D3D7CF   guibg=#6C6C6C
highlight SpellBad                            ctermbg=224                                             guibg=#FFD7D7
highlight SpellCap                            ctermbg=81                                              guibg=#5FD7FF
highlight SpellRare                           ctermbg=225                                             guibg=#FFD7FF
highlight SpellLocal                          ctermbg=14                                              guibg=#34E2E2
highlight Pmenu             ctermfg=0         ctermbg=225                             guifg=#2E3436   guibg=#FFD7FF
highlight PmenuSel          ctermfg=0         ctermbg=7                               guifg=#2E3436   guibg=#D3D7CF
highlight PmenuSbar                           ctermbg=248                                             guibg=#A8A8A8
highlight PmenuThumb                          ctermbg=0                                               guibg=#2E3436
highlight TabLine           ctermfg=0         ctermbg=7       cterm=underline         guifg=#2E3436   guibg=#D3D7CF   gui=underline
highlight TabLineSel                                          cterm=bold                                              gui=bold
highlight TabLineFill                                         cterm=reverse                                           gui=reverse
highlight CursorColumn                        ctermbg=7                                               guibg=#D3D7CF
highlight CursorLine                                          cterm=underline                                         gui=underline
highlight ColorColumn                         ctermbg=224                                             guibg=#FFD7D7
highlight StatusLineTerm    ctermfg=15        ctermbg=2       cterm=bold              guifg=#EEEEEC   guibg=#4E9A06   gui=bold
highlight StatusLineTermN   ctermfg=15        ctermbg=2                               guifg=#EEEEEC   guibg=#4E9A06
highlight MatchParen                          ctermbg=14                                              guibg=#34E2E2
highlight ToolbarLine                         ctermbg=7                                               guibg=#D3D7CF
highlight ToolbarButton     ctermfg=15        ctermbg=242     cterm=bold              guifg=#EEEEEC   guibg=#6C6C6C   gui=bold
highlight Comment           ctermfg=4                                                 guifg=#3465A4
highlight Constant          ctermfg=1                                                 guifg=#CC0000
highlight Special           ctermfg=5                                                 guifg=#75507B                   gui=none
highlight Identifier        ctermfg=6                         cterm=none              guifg=#06989A                   gui=none
highlight Statement         ctermfg=130                                               guifg=#AF5F00                   gui=none
highlight PreProc           ctermfg=5                                                 guifg=#75507B
highlight Type              ctermfg=2                                                 guifg=#4E9A06                   gui=none
highlight Underlined        ctermfg=5                         cterm=underline         guifg=#75507B                   gui=underline
highlight Ignore            ctermfg=15                                                guifg=#EEEEEC
highlight Error             ctermfg=15        ctermbg=9                               guifg=#EEEEEC   guibg=#EF2929
highlight Todo              ctermfg=0         ctermbg=11                              guifg=#2E3436   guibg=#FCE94F
highlight diffRemoved       ctermfg=12                                                guifg=#729FCF
"}}}

"{{{ cfy "
highlight CursorLine                          ctermbg=233     cterm=none                              guibg=#121212   gui=none
highlight VertSplit                                           cterm=none                                              gui=none
highlight SignColumn                          ctermbg=none                                            guibg=NONE

highlight SpellBad          ctermfg=160       ctermbg=248     cterm=bold              guifg=#D70000   guibg=#A8A8A8   gui=bold
highlight SpellCap          ctermfg=136       ctermbg=234     cterm=bold              guifg=#AF8700   guibg=#1C1C1C   gui=bold

highlight Pmenu             ctermfg=223       ctermbg=233     cterm=bold              guifg=#FFD7AF   guibg=#121212   gui=bold

highlight Search            ctermfg=none      ctermbg=black   cterm=bold              guifg=NONE      guibg=#000000   gui=bold
highlight VertSplit                                           cterm=none                                              gui=none
highlight MatchParen        ctermfg=none      ctermbg=black   cterm=bold              guifg=NONE      guibg=#000000   gui=bold
highlight Visual                              ctermbg=237                                             guibg=#3A3A3A

highlight DiffAdd           ctermfg=512       ctermbg=22      cterm=none              guifg=#000000   guibg=#005F00   gui=none
highlight DiffDelete        ctermfg=darkblue  ctermbg=black   cterm=none              guifg=darkblue  guibg=#000000   gui=none
highlight DiffChange        ctermfg=251       ctermbg=166     cterm=none              guifg=#C6C6C6   guibg=#D75F00   gui=none

highlight Folded            ctermfg=242       ctermbg=16      cterm=none              guifg=#6C6C6C   guibg=#000000   gui=none

highlight ColorColumn       ctermfg=none      ctermbg=black   cterm=bold              guifg=NONE      guibg=#000000   gui=bold

highlight GitGutterAdd      ctermfg=22        ctermbg=none    cterm=none              guifg=#005F00   guibg=NONE      gui=none
highlight GitGutterChange   ctermfg=166       ctermbg=none    cterm=none              guifg=#D75F00   guibg=NONE      gui=none
highlight GitGutterDelete   ctermfg=darkred   ctermbg=none    cterm=none              guifg=darkred   guibg=NONE      gui=none

highlight default link Overlength ColorColumn
"}}}

"{{{ LSP "
highlight CursorColumn                        ctermbg=236                                             guibg=#303030

highlight LspErrorHighlight                                   cterm=underline                                         gui=underline
highlight LspWarningHighlight                                 cterm=underline                                         gui=underline
highlight LspInformationHighlight                             cterm=underline                                         gui=underline
highlight LspErrorText            ctermfg=203 ctermbg=234     cterm=none              guifg=#FF5F5F   guibg=#1C1C1C   gui=none
highlight LspWarningText          ctermfg=213 ctermbg=16      cterm=none              guifg=#FF87FF   guibg=#000000   gui=none
highlight LspInformationText      ctermfg=153 ctermbg=16      cterm=none              guifg=#AFD7FF   guibg=#000000   gui=none
highlight LspHintText             ctermfg=153 ctermbg=16      cterm=none              guifg=#AFD7FF   guibg=#000000   gui=none
"}}}

"{{{ Doxygen "
let g:load_doxygen_syntax = 1

highlight doxygenComment    ctermfg=blue      ctermbg=none    cterm=none              guifg=blue      guibg=NONE      gui=none
highlight doxygenBrief      ctermfg=darkblue  ctermbg=none    cterm=none              guifg=darkblue  guibg=NONE      gui=none
highlight doxygenParamName  ctermfg=darkgray  ctermbg=none    cterm=underline         guifg=darkgray  guibg=NONE      gui=none

highlight default link doxygenSpecialOnelineDesc doxygenBrief
"}}}
