" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" +---------+
" | Mappings |
" +---------+

nmap <Leader>; :Buffers<CR>
nnoremap <c-p> :FZF<cr>

nmap <Leader>ff :Files<CR>
nmap <Leader>ft :Tags<CR>
nmap <Leader>fh :History<CR>
