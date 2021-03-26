function! s:gruvbox_material_custom() abort
    hi clear SignColumn "resets the color form the github colorscheme
    hi GitGutterAdd    guifg=#009900 ctermfg=2 guibg=none
    hi GitGutterChange guifg=#bbbb00 ctermfg=3 guibg=none
    hi GitGutterDelete guifg=#ff2222 ctermfg=1 guibg=none
    hi! VertSplit guibg=NONE
    hi! LineNr guibg=NONE
    hi! EndOfmBuffer guibg=NONE guifg=white
endfunction

function! s:github_custom() abort
    hi! link HighlightedyankRegion Search
endfunction

augroup custom_theme
    autocmd!
    autocmd ColorScheme * call s:gruvbox_material_custom()
    autocmd ColorScheme github call s:github_custom()
augroup END

" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256

" colorscheme onedark

let g:sonokai_cursor = 'green'
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:lightline.colorscheme = 'sonokai'
colorscheme sonokai 

" set background=light
" let g:edge_style = 'aura'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 0
" let g:lightline.colorscheme = 'edge'
" colorscheme edge

 " set background=light
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_background = 'hard'
" let g:lightline.colorscheme = 'gruvbox_material'
" let g:gruvbox_material_enable_bold = 1
" colorscheme gruvbox-material

" let g:github_colors_soft = 1

" let g:lightline.colorscheme = 'github'
" colorscheme github 

" i have to overwrite my own styling after setting a colorscheme

" hi DiffDelete guifg=red guibg=none
" hi DiffChange guifg=orange guibg=none
" hi DiffAdd guifg=blue guibg=red
" hi DiffText guifg=black guibg=red
