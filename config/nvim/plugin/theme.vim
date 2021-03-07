" let g:lightline.colorscheme = 'sonokai'

" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256

" set background=dark
" colorscheme onedark

" let g:sonokai_cursor = 'green'
" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1
" colorscheme sonokai 
" let g:sonokai_disable_italic_comment = 1

set background=light
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

let g:lightline.colorscheme = 'edge'
colorscheme edge

"let g:github_colors_soft = 1
"let g:lightline.colorscheme = 'github'
" set background=light " for the light version
"colorscheme github 
"
" i have to overwrite my own styling after setting a colorscheme

" hi DiffDelete guifg=red guibg=none
" hi DiffChange guifg=orange guibg=none
" hi DiffAdd guifg=blue guibg=red
" hi DiffText guifg=black guibg=red
let g:gitgutter_set_sign_backgrounds=1

hi clear SignColumn "resets the color form the github colorscheme
hi GitGutterAdd    guifg=#009900 ctermfg=2 guibg=none
hi GitGutterChange guifg=#bbbb00 ctermfg=3 guibg=none
hi GitGutterDelete guifg=#ff2222 ctermfg=1 guibg=none

" highlight HighlightedyankRegion ctermbg=red guibg=red
hi VertSplit guibg=NONE
hi LineNr ctermbg=NONE  guibg=NONE
" hi EndOfBuffer guibg=NONE guifg=WHITE
hi SignColumn guibg=NONE

" hi clear DbgCurrentSign
" hi clear DbgCurrentLine
" hi clear DbgBreakptSign
" hi clear DbgBreakptLine

" hi DbgBreakptSign gui=bold
" hi link DbgBreakptLine DbgBreakptSign
" hi DbgCurrentSign gui=underline
" hi link DbgCurrentLine DbgCurrentSign
