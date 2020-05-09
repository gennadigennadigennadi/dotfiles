" nerdtree configuration

" close vim if nerdtree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction

nmap <leader>n :call NERDTreeToggleInCurDir()<CR>

" don't display informations (type ? for help and so on)
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40
" don't replace the native vim file explorer
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeQuitOnOpen = 0

" remapping - see nerdtree.txt and search for "NERDTreeMappings"
let NERDTreeMapOpenSplit = 'b'
let NERDTreeMapPreviewSplit='gb'

let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit='gv'
let g:NERDTreeMouseMode=3


let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

