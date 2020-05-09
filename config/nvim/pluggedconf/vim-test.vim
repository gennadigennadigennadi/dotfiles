" +---------+
" | Mappings |
" +---------+

" keymaps for vim-test
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tt :TestSuite<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tl :TestLast<CR>


" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
let test#php#phpunit#options = '--testdox'

" augroup test
"     autocmd!
"     autocmd BufWrite * if test#exists() |
"                 \   TestFile |
"                 \ endif
" augroup END
