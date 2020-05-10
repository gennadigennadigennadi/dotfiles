function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" let g:airline_theme='one'
let g:lightline = { 
            \ 'colorscheme' : 'github',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \           [ 'gitbranch' ], 
            \           [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction',
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

" let g:lightline = {
"             \ 'mode_map': {
"             \ 'n' : 'N',
"             \ 'i' : 'I',
"             \ 'R' : 'R',
"             \ 'v' : 'V',
"             \ 'V' : 'VL',
"             \ "\<C-v>": 'VB',
"             \ 'c' : 'C',
"             \ 's' : 'S',
"             \ 'S' : 'SL',
"             \ "\<C-s>": 'SB',
"             \ 't': 'T',
"             \ },
"             \ }
