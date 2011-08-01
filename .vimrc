set nocompatible

set modelines=0

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

let mapleader = ","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" don't close buffers, just hide them
set hidden

"set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set fileencodings=utf-8,cp1251

set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set nonumber
set shiftround
set showmatch
set ignorecase
set hlsearch
set incsearch
set relativenumber
"set wrapmargin=80
"au BufRead /tmp/mutt-* set tw=72
au filetype scala set shiftwidth=2
au filetype scala set softtabstop=2

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
"set visualbell
"set noerrorbells

set nobackup
set noswapfile

filetype on
filetype plugin on
filetype indent on

"autocmd filetype python set expandtab

colorscheme herald
syntax on

set linebreak

"set list
"set listchars=tab:>-,trail:.,extends:#,nbsp:.
set listchars=tab:»·,trail:·
set list


set pastetoggle=<F2>

"nnoremap ; :

vmap Q gq
nmap Q gqap

"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set showtabline=2
nmap <C-t> :tabnew<cr>
map <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

nmap <silent> ,/ :let @/=""<CR>

cmap w!! w !sudo tee % >/dev/null

set mouse=a

nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

set directory=/tmp//
set backupdir=/tmp//

set synmaxcol=320

hi Comment ctermfg=243
