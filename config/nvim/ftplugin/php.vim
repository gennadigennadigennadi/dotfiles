" Put this function at the very end of your vimrc file.
" function! PhpSyntaxOverride()
"     " Put snippet overrides in this function.
"     hi! link phpDocTags phpDefine
"     hi! link phpDocParam phpType
" endfunction

" augroup phpSyntaxOverride
"     autocmd!
"     autocmd FileType php call PhpSyntaxOverride()
" augroup END

" Dollar is part of the variable // color wise
" let php_var_selector_is_identifier=1