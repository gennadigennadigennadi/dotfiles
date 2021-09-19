function! s:custom() abort
    hi clear SignColumn "resets the color form the github colorscheme
    hi GitSignsAdd    guifg=#009900 guibg=none
    hi GitSignsChange guifg=#bbbb00 guibg=none
    hi GitSignsDelete guifg=#ff2222 guibg=none
    hi! VertSplit guibg=NONE
    hi! LineNr guibg=NONE
    " hi! EndOfmBuffer guibg=NONE guifg=white
endfunction

augroup custom_theme
    autocmd!
    autocmd ColorScheme * call s:custom()
augroup END

function! colorscheme#selectColorschemeByMode() abort
    if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
        call SelectSonokai()
    else
        call SelectEdge()
    endif
endfunction

function! SelectGithub() abort
    set background=light  " for the light version of the theme

    let g:github_colors_soft = 1

    colorscheme github
endfunction

function! SelectEdge() abort
    set background=light  " for the light version of the theme

    let g:edge_style = 'aura'
    let g:edge_enable_italic = 1
    let g:edge_disable_italic_comment = 0

    colorscheme edge
endfunction

function! SelectSonokai() abort
    set background=dark   " for the dark version of the theme

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

