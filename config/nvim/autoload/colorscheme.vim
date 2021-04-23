function! s:gruvbox_material_custom() abort
    hi clear SignColumn "resets the color form the github colorscheme
    hi GitGutterAdd    guifg=#009900 ctermfg=2 guibg=none
    hi GitGutterChange guifg=#bbbb00 ctermfg=3 guibg=none
    hi GitGutterDelete guifg=#ff2222 ctermfg=1 guibg=none
    hi! VertSplit guibg=NONE
    hi! LineNr guibg=NONE
    hi! EndOfmBuffer guibg=NONE guifg=white
endfunction

augroup custom_theme
    autocmd!
    autocmd ColorScheme * call s:gruvbox_material_custom()
augroup END

function! colorscheme#selectColorschemeByMode() abort
    if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
        set background=dark   " for the dark version of the theme
        call SelectSonokai()
    else
        set background=light  " for the light version of the theme
        call SelectEdge()
    endif
endfunction

function! SelectGithub() abort
    let g:github_colors_soft = 1

    colorscheme github
endfunction

function! SelectEdge() abort
    let g:edge_style = 'aura'
    let g:edge_enable_italic = 1
    let g:edge_disable_italic_comment = 0

    colorscheme edge
endfunction

function! SelectSonokai() abort
    let g:sonokai_style = 'andromeda'
    let g:sonokai_enable_italic = 1
    let g:sonokai_disable_italic_comment = 0

    colorscheme sonokai
endfunction

function! SelectGruvbox() abort
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_background = 'soft'
    let g:gruvbox_material_enable_bold = 1

    colorscheme gruvbox-material
endfunction

