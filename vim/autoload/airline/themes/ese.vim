let g:airline#themes#ese#palette = {}

function! airline#themes#ese#refresh()
  let g:airline#themes#ese#palette.accents = {
        \ 'red': airline#themes#get_highlight('Constant'),
        \ }

  " let s:N1 = airline#themes#get_highlight2(['DbgCurrent', 'bg'], ['Folded', 'fg'], 'bold')
  let s:N1 = [ '#aaaaaa' , '#000000' , 232 , 244 , 'bold' ]
  let s:N2 = airline#themes#get_highlight2(['Folded', 'fg'], ['Folded', 'bg'], 'none')
  let s:N3 = airline#themes#get_highlight('Comment')
  let s:Nmod = airline#themes#get_highlight('Comment')
  let s:Nwarn = [ '#aaaaaa' , '#000000' , 223 , 94 , 'none' ]
  let s:Nerr = [ '#aaaaaa' , '#000000' , 223 ,  88 , 'none' ]

  let g:airline#themes#ese#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#ese#palette.normal.airline_c = s:Nmod
  let g:airline#themes#ese#palette.normal.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.normal.airline_error = s:Nerr
  let g:airline#themes#ese#palette.normal_modified = { 'airline_c': s:Nmod }
  let g:airline#themes#ese#palette.normal_modified.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.normal_modified.airline_error = s:Nerr

  " let s:I1 = airline#themes#get_highlight2(['DbgCurrent', 'bg'], ['String', 'fg'], 'bold')
  let s:I1 = [ '#aaaaaa' , '#000000' , 232 , 106 , 'bold' ]
  let s:I2 = [ '#aaaaaa' , '#000000' , 106 , 233 , '' ]
  " let s:I2 = airline#themes#get_highlight2(['String', 'fg'], ['Folded', 'bg'])
  let s:I3 = s:N3
  let g:airline#themes#ese#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#ese#palette.insert.airline_c = s:Nmod
  let g:airline#themes#ese#palette.insert.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.insert.airline_error = s:Nerr
  let g:airline#themes#ese#palette.insert_modified = g:airline#themes#ese#palette.normal_modified
  let g:airline#themes#ese#palette.insert_modified.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.insert_modified.airline_error = s:Nerr

  " let s:R1 = airline#themes#get_highlight2(['DbgCurrent', 'bg'], ['Comment', 'fg'], 'bold')
  let s:R1 = [ '#aaaaaa' , '#000000' , 232 , 105 , 'bold' ]
  let s:R2 = [ '#aaaaaa' , '#000000' , 105 , 233 , '' ]
  " let s:R2 = airline#themes#get_highlight2(['Comment', 'fg'], ['Folded', 'bg'])
  let s:R3 = s:N3
  let g:airline#themes#ese#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#ese#palette.replace.airline_c = s:Nmod
  let g:airline#themes#ese#palette.replace.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.replace.airline_error = s:Nerr
  let g:airline#themes#ese#palette.replace_modified = g:airline#themes#ese#palette.normal_modified
  let g:airline#themes#ese#palette.replace_modified.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.replace_modified.airline_error = s:Nerr

  " let s:V1 = airline#themes#get_highlight2(['DbgCurrent', 'bg'], ['Identifier', 'fg'], 'bold')
  " let s:V2 = airline#themes#get_highlight2(['Identifier', 'fg'], ['Folded', 'bg'])
  let s:V1 = [ '#aaaaaa' , '#000000' , 232 , 174 , 'bold' ]
  let s:V2 = [ '#aaaaaa' , '#000000' , 174 , 233 , '' ]
  let s:V3 = s:N3
  let g:airline#themes#ese#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#ese#palette.visual.airline_c = s:Nmod
  let g:airline#themes#ese#palette.visual.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.visual.airline_error = s:Nerr
  let g:airline#themes#ese#palette.visual_modified = g:airline#themes#ese#palette.normal_modified
  let g:airline#themes#ese#palette.visual_modified.airline_warning = s:Nwarn
  let g:airline#themes#ese#palette.visual_modified.airline_error = s:Nerr

  let s:IA = airline#themes#get_highlight('NonText')
  let g:airline#themes#ese#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#ese#palette.inactive_modified = { 'airline_c': s:Nmod }
endfunction

call airline#themes#ese#refresh()
