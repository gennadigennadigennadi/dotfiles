let php_var_selector_is_identifier=1

function! PhpSyntaxOverride()
    " Put snippet overrides in this function.
    hi! link phpDocTags phpDefine
    autocmd FileType php set iskeyword+=$
    " hi! phpFunctions guifg=red guibg=NONE gui=NONE
    " hi! phpMemberSelector guifg=red guibg=NONE gui=NONE   
    hi! link phpDocParam phpType
endfunction
