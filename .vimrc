set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Please note that that's how you add plugins

filetype plugin indent on " required!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable " Tunr on syntax highlistging
set background=dark
colorscheme base16-ocean

set hidden " Leave hidden buffers open
set history=100 "by default Vim saves your last 8 commands.  We can handle more
syntax enable
set number
set nowrap
set cursorline


" invisible char
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set linespace=2

if has('gui_running')
  set guifont=Source\ Code\ Pro\ Medium:h14
endif

" VISUALS

syntax enable                       " Enable Syntax Highlighting
set t_Co=256                        " 256 colours, please
set background=dark               " Dark background
colorscheme solarized         " Dark Color Scheme
" colorscheme base16-ocean          " Dark Color Scheme
hi normal ctermbg=NONE              " Stuff for iTerm
" Tabs, indentation and lines
filetype plugin indent on
" 4 spaces please
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Round indent to nearest multiple of 4
set shiftround

set wrap " Word wrapping
" set textwidth=90
" set formatoptions=cqt
" set formatoptions=qrn1 " Make line wrap create new vim line
set smartindent
set breakindent " Make word wrapping behave like it does in every other sane text editor
set autoindent
set wrap linebreak nolist
set linespace=4

" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title

" Limit line-length to 80 columns by highlighting col 81
if exists("+colorcolumn")
    set colorcolumn=81
endif
" Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
" That bell is the worst sound. Shut it the fuck off.
set visualbell

" Set relevant filetypes
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.lens set filetype=html


" INTERACTIONS

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
set iskeyword-=_
set autoread " Make Vim automatically open changed files (e.g. changed after a Git commit)
" set iskeyword+=- "Makes foo-bar considered one word