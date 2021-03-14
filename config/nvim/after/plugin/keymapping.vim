" weird hack for nerdtree to work
let mapleader = "\\"
let maplocalleader = "\\"
map <space> <leader>
map <space> <localleader>

nmap <silent> <esc> :nohlsearch<cr>
nmap <leader>rr :source $MYVIMRC<CR>
nmap <leader>rs :source %<CR>

nnoremap <silent> <leader>x <cmd>bp <bar>bd #<cr> " close the buffer
nnoremap <silent> <c-q> :q!<CR>
noremap <silent><c-s> <C-C>:update<CR> " save file, only if it was edit

"noremap <silent> :vsplit<CR>
"noremap <silent> :split<CR>

" deactivate arrow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

nnoremap J mzJ`z " Keep the cursor in place while joining lines

""" close Terminal/fzf Windows/Overlays 
:augroup terminal-close
  :au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  :au FileType fzf tunmap <buffer> <Esc>
:augroup END

"" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tx :tabclose<CR>

"" move tab to first position
nnoremap tH :tabm 0<CR>
nnoremap tL :tabm<CR>

"" Disable anoying ex mode
nnoremap Q <Nop>

"" Save files as root 
cnoremap w!! execute ':w suda://%'

"" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

nmap <Leader>; :Buffers<CR>
nmap <silent><Leader>ff :Files<CR>
nmap <silent><Leader>ft :Tags<CR>
nmap <silent><Leader>fh :History<CR>
nmap <silent><Leader>fr :Rg<CR> 

nmap <leader>H :TSHighlightCapturesUnderCursor<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
