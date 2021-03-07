" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" set rtp+=/opt/homebrew/opt/fzf

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
" let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,1 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


" +---------+
" | Mappings |
" +---------+
" nmap <Leader>; :Buffers<CR>
" nmap <Leader>ff :Files<CR>
" " nmap <Leader>ft :Tags<CR>
" nmap <Leader>fh :History<CR>
" nmap <Leader>fr :Rg! 
