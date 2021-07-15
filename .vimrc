" use vim features
set nocompatible
" use utf-8 by default
set encoding=utf-8
set fileencodings=utf-8
" don't close buffers, just hide them
set hidden
" detect file types, load plugin and indent files for them
filetype plugin on
filetype indent on
" use syntax highlighting with custom color theme
syntax on
colorscheme rybalkin
" use 4 spaces by default and no tabs
set shiftwidth=4
set softtabstop=4
set expandtab
" disable text wrapping
set nowrap
" allow backspacing over autoindent
" allow backspacing over line breaks (join lines)
" allow backspacing over the start of insert
set backspace=indent,eol,start
" auto indent and copy space characters from previous line
set autoindent
set copyindent
" round indent to multiple of 'shiftwidth'
set shiftround
" ignore case in search patterns
set ignorecase
" highlight all matches of previous search pattern
" highlight matches while typing
set hlsearch
set incsearch
" remember some history
set history=1000
" maximum number of changes that can be undone
set undolevels=1000
" ignore these patterns while completing file names
set wildignore=*.pyc
" make no backups
set nobackup
" make no swap files, please
set noswapfile
" show trailing spaces and all tabs
set listchars=tab:»·,trail:·
set list
" use F2 to toggle paste-mode
set pastetoggle=<F2>
" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" always show tabs, even if only one
set showtabline=2
" easy new tab creation
nmap <C-t> :tabnew<cr>
map <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
" use mouse in normal, visual, insert, command-line modes
set mouse=a
" highlight from start of file
autocmd BufEnter * :syntax sync fromstart
" do not highlight syntax for long lines
set synmaxcol=320
" do not highlight current line and column
set nocursorline
set nocursorcolumn
" show line numbers (with width 2)
set number
set numberwidth=2
" easy split window creation
map <C-p> :rightb vnew<cr>
map <C-m> :rightb new<cr>
" do not save viminfo
set viminfo=
" no .netrwhist files
let g:netrw_dirhistmax=0
" no context lines above or below cursor
set scrolloff=0
" disable folding (e.g. in *.rst files)
set nofoldenable
