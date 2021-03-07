" weird hack for nerdtree to work
let mapleader = "\\"
let maplocalleader = "\\"
map <space> <leader>
map <space> <localleader>

nmap <silent> <esc> :nohlsearch<cr>
" Custom commands
" ===============
nmap <leader>rr :source $MYVIMRC<CR>

" close the buffer
nmap <leader>q :Bdelete!<CR>

" save file, only if it was edit
nnoremap <silent> <leader>s <C-C>:update<CR>

nmap <silent> <leader>x :q!<CR>

" arrow keys resize windows
" nnoremap ¬ :vertical resize -2<CR> " alt+l
" nnoremap ˙ :vertical resize +2<CR> " alt+h
" nnoremap ˚ :resize -2<CR> " alt+k
" nnoremap ∆ :resize +2<CR> " alt+j

" deactivate arrow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" escape terminal mode 
" tnoremap <Esc> <C-\><C-n> 

" close Terminal/fzf Windows/Overlays 
:augroup terminal-close
  :au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  :au FileType fzf tunmap <buffer> <Esc>
:augroup END

" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tx :tabclose<CR>

" move tab to first position
nnoremap tH :tabm 0<CR>
nnoremap tL :tabm<CR>

" Disable anoying ex mode
nnoremap Q <Nop>

" Save files as root 
cnoremap w!! execute ':w suda://%'

" open File Drawer
nmap <silent><leader>1 :call NERDTreeToggleInCurDir()<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>
" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
"
nmap <Leader>; :Buffers<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>ft :Tags<CR>
nmap <Leader>fh :History<CR>
nmap <Leader>fr :Rg<CR> 
