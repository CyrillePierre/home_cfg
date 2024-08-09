" syn clear cBlock
"
" " couleur des caractère spéciaux :
" syn match cBlockSymbol /[{}]/ display
" syn region cBlock matchgroup=cBlockSymbol start=/{/ end=/}/ transparent fold
" syn match cSymbol #[()\[\],.;:]# display
" syn match cSymbolOperator #[|<>*+^/!?%&~=-]# display contains=cComment,cCommentL
"
" highlight link cBlockSymbol Special
" highlight link cSymbol Special
" highlight link cSymbolOperator Operator
"
" " mot clé de doxyfile
" "syn keyword cDoxy @brief @param @file @author @date @class @struct @function @fn @return @note \brief \param \file \author \date \class \struct \fn \return \function \note
" syn match cDoxy /[@\\]\w*/
" "syn cluster cCommentGroup add=cDoxy
" highlight cDoxy guifg=#babaff gui=bold
