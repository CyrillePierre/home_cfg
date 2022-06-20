" quelque mot clé de la stl
"syn keyword STL set multiset map multipmap string vector list deque hash hash_set hash_map hash_multiset hash_multimap queue stack priority_queue bitset rope pair
"highlight link STL Type

syn clear cSymbol
syn clear cSymbolOperator

syn match cSymbol #[()\[\]<>,.;:]# display
syn match cSymbolOperator #[|*+^/!?%&~=-]# display contains=cComment,cCommentL

highlight link cSymbolOperator Special
highlight link cOperator Operator
