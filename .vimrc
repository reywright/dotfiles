" initial options to make things work right
se nocp
filetype off
filetype plugin indent on   " required!

" settings
"
se nowrap shiftwidth=2 softtabstop=2 expandtab
" se autoindent
se backspace=2
se showbreak=↪\ 
se autoread ttyfast
se backupdir=~/.vim/_backup/ dir=~/.vim/_temp/
   " change where swap files save
se laststatus=2
   " always show status
se number
   " show line numbers
se encoding=utf-8
se showcmd showmode ruler more
se shortmess+=atTWI
se incsearch ignorecase smartcase
se wildmenu wildmode=list:longest,full

se hidden


   " allow buffers to exist without being actively worked on

" se sidescroll=50

se wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
se wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*/.sass-cache/*
se wildignore+=*.swp,*~,._*
se listchars=precedes:<,extends:>,tab:\|-,trail:· list
se backspace=indent,eol,start

" set statusline=
" set statusline +=*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path

" set laststatus=2
" set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" I likey this one
" set statusline=%F%m%r%h%w\ 
" set statusline+=%{fugitive#statusline()}\    
"h set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
" set statusline +=%2*%m%*                "modified flag
" set statusline+=%=\ [line\ %l\/%L]
"
"
tabnew
bwipeout

nnoremap <Leader>sh Hmx`` \|:split<CR>`xzt``p
"hnnoremap <Leader>sv Hmx`` \|:split<CR>`xzt``p

"o
"o
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

let mapleader = ","

" Window pane navigation shortcut
nn <Leader>h <c-w>h
nn <Leader>j <c-w>j
nn <Leader>k <c-w>k
nn <Leader>l <c-w>l

"Figure out what this does...
" vnoremap <silent> zz :<C-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<Bar>normal! zzgv<CR>
" vnoremap <silent> zt :<C-u>call setpos('.',[0,line("'<"),0,0])<Bar>normal! ztgv<CR>
" vnoremap <silent> zb :<C-u>call setpos('.',[0,line("'>"),0,0])<Bar>normal! zbgv<CR>

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

" Shortcut for Ack
nnoremap <Leader>f :Ack!<space>

" Turns highlighting back on
nnoremap <leader>df :set hlsearch!<CR>

" Yank to end of line
nn Y y$

" Map colon to semicolon, map semicolon to colon
nn ; :
nn : ;

"finese these timeouts later
:set timeout timeoutlen=500 ttimeoutlen=100

" Map escape to jk
:imap jk <Esc>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on gihub
"
Bundle "vim-scripts/UltiSnips"
Bundle 'Osse/double-tap'
Bundle 'jeetsukumaran/vim-buffergator'
" Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/matchit.zip'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" Bundle 'vim-scripts/vimwiki'

" Vimscript repos
" Bundle 'Align'

" colorschemes:
Bundle 'rey-wright/argokai'
Bundle 'vim-scripts/rootwater.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'tristen/superman'
Bundle 'tomasr/molokai'
Bundle 'sjl/badwolf'
Bundle 'toupeira/vim-desertink'
Bundle 'noahfrederick/Hemisu'
Bundle 'mayansmoke'
Bundle 'altercation/vim-colors-solarized'

let g:UltiSnipsExpandTrigger="<tab>"

" se shiftround


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
