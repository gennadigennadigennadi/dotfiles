source ~/.config/nvim/plug.vim
source ~/.config/nvim/keymapping.vim

" source every plugin configs
for file in split(glob("~/.config/nvim/pluggedconf/*.vim"), '\n')
    execute 'source' file
endfor

filetype plugin indent on       " required
" That bell is the worst sound. Shut it the fuck off.
set visualbell

" General Config
" ==============

" weird hack for nerdtree to work
let mapleader = "\\"
let maplocalleader = "\\"
map <space> <leader>
map <space> <localleader>

nmap <silent> <esc> :nohlsearch<cr>
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " see :help shortmess

set formatoptions-=cro "
set pumheight=10

" Appearance
" ==========
set conceallevel=0
set cursorline " Highlight current line
set title " Show file title in terminal tab

" highlight Comment cterm=italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" set Vim-specific sequences for RGB colors                                                                                                                                                               
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"                                                                                                                                                                    
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"   
 
if (has("termguicolors"))
    set termguicolors
endif

set background=dark " for the dark version
" set background=light " for the light version


let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

colorscheme onedark
"
" use a slightly darker background, like GitHub inline code blocks
" let g:github_colors_soft = 0

" colorscheme github 

" Theme
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
"
" i have to overwrite my own styling after setting a colorscheme
highlight clear SignColumn "resets the color form the github colorscheme
" hi DiffDelete ctermfg=red ctermbg=NONE cterm=NONE guifg=red guibg=none
" hi DiffChange ctermfg=blue ctermbg=NONE cterm=NONE guifg=orange guibg=none
" hi DiffAdd ctermfg=white ctermbg=NONE cterm=NONE guifg=blue guibg=none
" hi DiffText ctermfg=yellow ctermbg=NONE cterm=NONE guifg=black guibg=none

hi LineNr ctermbg=NONE  guibg=NONE

" hi clear DbgCurrentSign
" hi clear DbgCurrentLine
" hi clear DbgBreakptSign
" hi clear DbgBreakptLine

hi DbgBreakptSign gui=bold
hi link DbgBreakptLine DbgBreakptSign
hi DbgCurrentSign gui=underline
hi link DbgCurrentLine DbgCurrentSign
" ==============================================

set relativenumber              " prefer absolute #
set backspace=indent,eol,start  " Allow backspace in insert mode
set listchars=space:·,nbsp:·,trail:·,precedes:«,extends:»,tab:▸·,eol:¬
" set list
set autowrite
set hidden                      " Buffers can exist in the background
set whichwrap=h,l,b,<,>,~,[,] " Allow motions and back-spacing over line-endings etc
set shellpipe=2>/dev/null> "Don't dump distracting text to terminal during searches!
set re=1                        "Use a non-broken regex engine for syntax highlighting

" INTERACTIONS

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=10
set sidescrolloff=10
set sidescroll=1

set iskeyword+=- "Makes foo-bar considered one word
" set iskeyword+=$ " $ is part of the Name

" Indentation and Display
" =======================

filetype plugin indent on

set shiftwidth=4
set smartindent " show existing tab with 4 spaces width
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab " when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

set number
set breakindent " Make word wrapping behave like it does in every other sane text editor
set nowrap " set wrap linebreak
set cmdheight=2 " Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
set undofile

" Use the system clipboard
set clipboard^=unnamed,unnamedplus

" Remove the delay when escaping from insert-mode
set timeoutlen=1000 ttimeoutlen=0

" Enable mouse support, helpful for changing split size
set mouse=a

" Search Settings
" ===============
set ignorecase       " Ignore case when searching...
set smartcase        " ...except if we input a capital letter

" Folds
" =====
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Plugin Options
" ==============
set noshowmode          " Le airline handle the mode display

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" set wildmode=longest,full

" Restore cursor position when opening file
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   execute "normal! g`\"" |
            \ endif

let g:fubitive_domain_pattern = 'bitbucket\.uptrade\.de'
