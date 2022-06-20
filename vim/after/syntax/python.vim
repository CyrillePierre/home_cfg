syn match pythonSpecialChar #[{}()\[\],.;:]# display
syn match pythonOperatorChar #[<>|*+^/!?%&~=-]# display contains=cComment,cCommentL

highlight link pythonSpecialChar SpecialChar
highlight link pythonOperatorChar Operator
