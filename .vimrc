""
" General
" "

set nocompatible  " disable vi compatibility.
filetype off      " required!
set laststatus=2
syntax on
syntax enable
set encoding=utf-8
set number
set incsearch
set showcmd

" New Leader
let mapleader = ","

""
" Whitespace
""

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list
set backspace=indent,eol,start

set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<

set ignorecase
set smartcase

"	
""
" Backup and swap files
""

set backupdir=~/.vim/_backup/
set directory=~/.vim/_temp/

" Enable enhanced command-line completion
set wildmenu

" Disable output and VCS files, archive files, bundler & sass cache, & temp / backup files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Window pane navigation shortcut
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
nnoremap <Leader>f :Ack<space>

" Turns highlighting back on
nnoremap <leader>h :set hlsearch!<CR>

" Yank to end of line
map Y y$

" Shortcut for all vim commands
noremap ; :
vnoremap ; :

" Map semi-colon back to colon for motion repeating
noremap : ;
vnoremap : ;

" Hide those stupid buffer errors
set hidden

" Clear all current highlighted from search
  "nmap <silent> ,/ :nohlsearch<CR>
	"`
" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on gihub
Bundle 'Osse/double-tap'
Bundle 'tpope/vim-fugitive'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'

" Vimscript repos
Bundle 'Align'

" colorschemes:
"
Bundle 'rey-wright/argokai'

filetype plugin indent on   " required!

"
" Brief help
" :BundleList     - list configured bundles
" :BundleInstall(!)   - install(updated) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)   - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed...

source ~/.vimrc.local
