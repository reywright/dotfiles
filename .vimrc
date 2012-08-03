" initial options to make things work right
se nocp
filetype off

" settings
"
se nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab
se autoindent
se backspace=2
se showbreak=»
se autoread ttyfast lazyredraw
se backupdir=~/.vim/_backup/ dir=~/.vim/_temp/
se laststatus=2
se number
se ff=unix fileencoding=utf-8 encoding=utf-8
se showcmd showmode ruler more
se shortmess+=atTWI
se incsearch ignorecase smartcase
se wildmenu wildmode=list:longest,full
se hidden
se sidescroll=50
se wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
se wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*/.sass-cache/*
se wildignore+=*.swp,*~,._*
se listchars=precedes:<,extends:>,tab:\|-,trail:· list
set backspace=indent,eol,start
" se shiftround

let mapleader = ","

" paste from X clipboard
map <silent> <leader>p "*p
map <silent> <leader>P "*P

" Window pane navigation shortcut
nn <Leader>h <c-w>h
nn <Leader>j <c-w>j
nn <Leader>k <c-w>k
nn <Leader>l <c-w>l

"Figure out what this does...
vnoremap <silent> zz :<C-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<Bar>normal! zzgv<CR>
vnoremap <silent> zt :<C-u>call setpos('.',[0,line("'<"),0,0])<Bar>normal! ztgv<CR>
vnoremap <silent> zb :<C-u>call setpos('.',[0,line("'>"),0,0])<Bar>normal! zbgv<CR>

" move through virtual lines, rows as determined by terminal even if wrapped
nn j gj
nn k gk
" and when those wrapped lines are massive, do this!
nn gj j
nn gk k

"Autoload .vimrc when changed
" augroup myvimrchooks
"     au!
"     autocmd bufwritepost .vimrc source ~/.vimrc
" augroup END

se nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Shortcut for Ack
nnoremap <Leader>f :Ack<space>

" Turns highlighting back on
nnoremap <leader>df :set hlsearch!<CR>

" Yank to end of line
nn Y y$

" Map colon to semicolon, map semicolon to colon
nn ; :
nn : ;

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
Bundle 'vim-scripts/vimwiki'

" Vimscript repos
Bundle 'Align'

" colorschemes:
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
