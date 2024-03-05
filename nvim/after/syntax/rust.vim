syn match rustBlockCharacter #[(){}\[\].,;]# display contains=cComment,cCommentL

highlight link rustBlockCharacter Special
