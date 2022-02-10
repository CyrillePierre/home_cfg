" couleur des caractère spéciaux :
syn match cBlockSymbol /[{}]/ display
syn clear cBlock
syn region cBlock start=/{/ end=/}/ matchgroup=cBlockSymbol transparent fold
syn match cSymbol #[()\[\]|<>*+^/,.;:!?%&~=-]# display contains=cComment,cCommentL

highlight link cSymbol Operator
highlight link cBlockSymbol Operator

" mot clé de doxyfile
"syn keyword cDoxy @brief @param @file @author @date @class @struct @function @fn @return @note \brief \param \file \author \date \class \struct \fn \return \function \note
syn match cDoxy /[@\\]\w*/
"syn cluster cCommentGroup add=cDoxy
highlight cDoxy guifg=#babaff gui=bold
