" set visualbell

" General Config
" ==============

set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
" set shortmess=filnxtToOI        " see :help shortmess

" set formatoptions-=cro " i don't know what this is for
set pumheight=10

" Appearance
" ==========
set conceallevel=0
set cursorline " Highlight current line
set title " Show file title in terminal tab

set termguicolors

set relativenumber " prefer absolute
set number " show current linenumber you are on
set listchars=space:·,nbsp:·,trail:·,precedes:«,extends:»,tab:▸·,eol:¬
" set list
set autowrite

set hidden                      " Buffers can exist in the background
set whichwrap=h,l,,<,>,~,[,] " Allow motions and back-spacing over line-endings etc
set shellpipe=2>/dev/null> "Don't dump distracting text to terminal during searches!

" INTERACTIONS

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=10
set sidescrolloff=10
set sidescroll=1

" set iskeyword+=- "Makes foo-bar considered one word
" set iskeyword+=$ " $ is part of the Name

" Indentation and Display
" =======================

set shiftwidth=4
set autoindent
set smartindent " show existing tab with 4 spaces width
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab " when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

set breakindent " Make word wrapping behave like it does in every other sane text editor
set nowrap " set wrap linebreak
set cmdheight=2 " Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
set undofile

" Use the system clipboard
set clipboard^=unnamed,unnamedplus

" Remove the delay when escaping from insert-mode
set timeoutlen=1000 ttimeoutlen=0

set mouse=a " Enable mouse support, helpful for changing split size

" Search Settings
" ===============
set ignorecase       " Ignore case when searching...
set smartcase        " ...except if we input a capital letter

" Folds
" =====
set foldmethod=indent   " Fold based on indent
" set foldmethod=marker
" set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Plugin Options
" ==============
set noshowmode          " Le airline handle the mode display

set completeopt=noinsert,menuone,noselect
" set wildmode=longest,full
let g:netrw_banner = 0

" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
let g:vimsyn_embed = 'l' "activate in line lua highlighting
