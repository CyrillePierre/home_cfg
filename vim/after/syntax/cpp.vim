" quelque mot clé de la stl
"syn keyword STL set multiset map multipmap string vector list deque hash hash_set hash_map hash_multiset hash_multimap queue stack priority_queue bitset rope pair
"highlight link STL Type

" syn clear cSymbol
" syn clear cSymbolOperator
syntax match cppSpecialChar #[()\[\]<>,.;:]# display
syntax match cppOperatorChar #[|*+^/!?%&~=-]# display contains=cComment,cCommentL

highlight link cppSpecialChar SpecialChar
highlight link cppOperatorChar Operator
