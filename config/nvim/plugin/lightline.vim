function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline = { 
            \ 'active': {
            \   'left': [ 
            \               [ 'mode', 'paste' ],
            \               [ 'gitbranch' ], 
            \               [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] 
            \           ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction',
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

