" Vim color file
" Maintainer: Cyrille Pierre <cypierre58@gmail.com>
" Last Change:  2024 Mars 05

hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "ese_dark"

" Console
highlight Normal       guifg=#FFD7AF
highlight NormalFloat                 guibg=#112d2d
highlight Search       guifg=#080808  guibg=#c59a43  gui=none
highlight CurSearch    guifg=#080808  guibg=#d9be8b  gui=none
highlight Folded       guifg=#BCBCBC  guibg=#262626
highlight CursorLine                  guibg=#000000  gui=none
highlight SpellBad                    guibg=#5F0000
highlight SpellCap                    guibg=#080808  gui=none
highlight Visual                      guibg=#585858
highlight Error        guifg=#E4E4E4  guibg=#5F0000
highlight Pmenu        guifg=#D0D0D0  guibg=#083636
highlight Pmenusel     guifg=#E4E4E4  guibg=#095c5c
highlight SpecialKey   guifg=#5FAF87
highlight Directory    guifg=#5FAF87
highlight Todo         guifg=#3A3A3A  guibg=#D7AF5F
highlight WildMenu                    guibg=#A8A8A8
highlight OverLength                  guibg=#5F005F
highlight ColorColumn                 guibg=#262626
highlight MatchParen   guifg=#5FD7AF  guibg=none     gui=bold
highlight Title        guifg=#D08000
highlight CursorColumn                guibg=#3A3A3A
highlight VertSplit    guifg=#837c69                 gui=none
highlight SignColumn                  guibg=none
highlight LineNr       guifg=#837c69  guibg=none     gui=none
highlight CursorLineNr guifg=#d9cfb6  guibg=none     gui=none
highlight NonText      guifg=#3366c4

" Code
highlight Comment      guifg=#77819b
highlight Type         guifg=#96bd9a                 gui=none
highlight cppStructure guifg=#c9929b                 gui=bold
highlight Function     guifg=#fefbed                 gui=none
highlight Identifier   guifg=#feefc9                 gui=none
highlight @variable    guifg=#f6cda4                 gui=none
highlight Statement    guifg=#e29f46                 gui=bold
highlight PreProc      guifg=#cf831b
highlight Special      guifg=#D7AF5F
highlight Operator     guifg=#d67474
highlight Constant     guifg=#92e2d0
highlight String       guifg=#b6c342


" highlight LspErrorHighlight                               gui=underline
" highlight LspWarningHighlight                             gui=underline
" highlight LspInformationHighlight                         gui=underline
" highlight LspErrorText            guifg=#F05F50           gui=none
" highlight LspWarningText          guifg=#F087DA           gui=none
" highlight LspInformationText      guifg=#A0D7F0           gui=none
" highlight LspHintText             guifg=#A0D7F0           gui=none
" highlight link LspErrorVirtualText LspErrorText
" highlight link LspWarningVirtualText LspWarningText
" highlight link LspInformationVirtualText LspInformationText
" highlight link LspHintVirtualText LspHintText
" highlight link LspCodeActionText Normal

highlight DiagnosticError  guifg=#f32914  gui=none
highlight DiagnosticWarn   guifg=#ec85e6  gui=none
highlight DiagnosticInfo   guifg=#74c8ee  gui=none
highlight DiagnosticHint   guifg=#74c8ee  gui=none
highlight DiagnosticOk     guifg=#21e056  gui=none

"{{{ cfy "
highlight DiffAdd           guifg=#000000   guibg=#306F10   gui=none
highlight DiffDelete        guifg=darkblue  guibg=#000000   gui=none
highlight DiffChange        guifg=#C6C6C6   guibg=#B75F00   gui=none

highlight GitGutterAdd      guifg=#306F10   guibg=none      gui=none
highlight GitGutterChange   guifg=#B75F00   guibg=none      gui=none
highlight GitGutterDelete   guifg=darkred   guibg=none      gui=none

highlight default link Overlength ColorColumn
"}}}

"{{{ Doxygen "
let g:load_doxygen_syntax = 1

highlight doxygenComment    guifg=#6387ab   guibg=none      gui=none
highlight doxygenBrief      guifg=#6387ab   guibg=none      gui=none
highlight doxygenParamName  guifg=#6387ab   guibg=none      gui=none

highlight default link doxygenSpecialOnelineDesc doxygenBrief
"}}}

highlight NeoTreeGitIgnored   guifg=#888888
