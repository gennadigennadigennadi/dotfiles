call plug#begin($HOME . '/.local/share/nvim/plugged')

" # Theme
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify' " fancy vim bootscreen
Plug 'itchyny/lightline.vim' " simple powerline tool

Plug 'wakatime/vim-wakatime'
Plug 'machakann/vim-highlightedyank' " highlights yanked lines

Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
Plug 'janko/vim-test' " quick test execution

Plug 'swekaj/php-foldexpr.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator' " tmux like pane switching ctrl + hjkl
Plug 'liuchengxu/vista.vim'
 
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']} | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree + modifications 
Plug 'wincent/ferret'  " Ack multi file search

Plug 'moll/vim-bbye' " Close the current buffer :Bdelete and :Bwipeout (remove buffer from jumplist)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake' " Asynchronous linting for every languages

Plug 'tpope/vim-commentary' " gcc

" [],(), {}, <> Auto Sourrinding mapping, Try cs"'
" Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify' " Git Wrapper for Vim + Gutter
Plug 'https://github.com/kmARC/vim-fubitive.git' " Gbrowse for bitbucket
Plug 'junegunn/gv.vim' " Git History Browser

Plug 'joonty/vdebug'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " <leader> + pcf
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
" Plug 'tobyS/pdv' " php Documentor der schon etwas älter ist

" Auto completion
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()      

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

" Appearance
" ==========

set cursorline " Highlight current line

" Show current line and column position in file
" Show file title in terminal tab
set title

" set background=dark " for the dark version
set background=light " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

" set background=dark " for the dark version
" set background=light " for the light version
" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256
" colorscheme onedark
" Sanity Config (Don't edit text like an animal)
" ==============================================

set relativenumber              " prefer absolute #
set backspace=indent,eol,start  " Allow backspace in insert mode
set listchars=space:·,nbsp:·,trail:·,precedes:«,extends:»,tab:▸·,eol:¬
" set list
set autowrite
set hidden                      " Buffers can exist in the background
" Allow motions and back-spacing over line-endings etc
set whichwrap=h,l,b,<,>,~,[,]

"Don't dump distracting text to terminal during searches!
set shellpipe=2>/dev/null>
set re=1                        "Use a non-broken regex engine for syntax highlighting

" INTERACTIONS

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

set iskeyword+=- "Makes foo-bar considered one word
set iskeyword+=$

" Indentation and Display
" =======================

filetype plugin indent on

set shiftwidth=4
set smartindent " show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

set number
set breakindent " Make word wrapping behave like it does in every other sane text editor
" set wrap linebreak
set nowrap
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

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
set linespace=1
set noshowmode          " Le airline handle the mode display

" Custom commands
" ===============
nmap <leader>rr :source $MYVIMRC<CR>

" close the buffer
nmap <leader>q :Bdelete!<cr>

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" arrow keys resize windows
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>

" deactivate arrow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" escape terminal mode 
tnoremap <Esc> <C-\><C-n> 

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Put this function at the very end of your vimrc file.
function! PhpSyntaxOverride()
    " Put snippet overrides in this function.
    hi! link phpDocTags phpDefine
    hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" Dollar is part of the variable // color wise
let php_var_selector_is_identifier=1

hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE

syn match phpParentOnly "[()]" contained containedin=phpParent
hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

" Restore cursor position when opening file
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   execute "normal! g`\"" |
            \ endif


let g:fubitive_domain_pattern = 'bitbucket\.uptrade\.de'

" highlight Comment cterm=italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

