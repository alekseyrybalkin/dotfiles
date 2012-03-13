" use vim features
set nocompatible
" auto-load plugin bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" use utf-8 by default, but understand cp1251 if encountered
set encoding=utf-8
set fileencodings=utf-8,cp1251
" don't close buffers, just hide them
set hidden
" detect file types, load plugin and indent files for them
filetype plugin on
filetype indent on
" use syntax highlighting
" use custom color scheme for this
syntax on
colorscheme ellen
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
" use 2 spaces by default for scala, perl and shell code
au filetype scala set shiftwidth=2
au filetype scala set softtabstop=2
au filetype perl set shiftwidth=2
au filetype perl set softtabstop=2
au filetype sh set shiftwidth=2
au filetype sh set softtabstop=2
" treat tt2 templates like html
au BufNewFile,BufRead *.tt2 set filetype=html
" remember some history
set history=1000
" maximum number of changes that can be undone
set undolevels=1000
" ignore these patterns while completing file names
set wildignore=*.pyc,*.class
" make no backups, use git, please
set nobackup
" make no swap files, please
set noswapfile
" show me trailing spaces and all tabs to kill
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
" easy file saving as root
cmap w!! w !sudo tee % >/dev/null
" use mouse in normal, visual, insert, command-line modes
set mouse=a
" do not highlight syntax for long lines
set synmaxcol=320
" highlight current line, but not column
set cursorline
set nocursorcolumn
" show line numbers (with width 2), relative if possible
if version >= 703
    set relativenumber
else
    set number
endif
set numberwidth=2
" easy split window creation
map <C-p> :rightb vnew<cr>
map <C-m> :rightb new<cr>
map <C-e> :FufFile<cr>
ca e FufFile
