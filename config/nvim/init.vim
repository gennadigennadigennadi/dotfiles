call plug#begin($HOME . '/.local/share/nvim/plugged')

" # Theme
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify' " fancy vim bootscreen
Plug 'itchyny/lightline.vim' " simple powerline tool

Plug 'wakatime/vim-wakatime'
Plug 'machakann/vim-highlightedyank' " highlights yanked lines

" Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
" Plug 'janko/vim-test' " quick test execution

Plug 'rking/ag.vim'
" Plug 'swekaj/php-foldexpr.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator' " tmux like pane switching ctrl + hjkl
Plug 'liuchengxu/vista.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'wincent/ferret' " <leader> + a 

" Close the current buffer :Bdelete and :Bwipeout (remove buffer from jumplist)
Plug 'moll/vim-bbye'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Asynchronous linting for every languages
Plug 'neomake/neomake'

" Commenting out
Plug 'tpope/vim-commentary' " gcc

" [],(), {}, <> Auto Sourrinding mapping, Try cs"'
" Plug 'tpope/vim-surround'

" Language
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

" Git Wrapper for Vim
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Gbrowse for bitbuckett
Plug 'https://github.com/kmARC/vim-fubitive.git'

Plug 'joonty/vdebug'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " <leader> + pcf
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
" Plug 'tobyS/pdv' " php Documentor der schon etwas älter ist

" Auto completion
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Distraction free writing // Zenmode
" Plug 'junegunn/goyo.vim'
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

" "Syntax highlighting should be in 256 colors
" Limit line-length to 80 columns by highlighting col 81
if exists("+colorcolumn")
    set colorcolumn=121
endif

set cursorline " Highlight current line

" Show current line and column position in file
" Show file title in terminal tab
set title
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif
" let g:onedark_termcolors=256
" set background=dark
set t_Co=256t 
" colorscheme onedark

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
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
map <leader>rr :source $MYVIMRC<CR>

" close the buffer
nmap <leader>q :Bdelete!<cr>
nmap <c-s> :w!<cr>

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
