" Brought to you by Vundle
se nocp
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles here:
" Bundle "vim-scripts/UltiSnips"
" Bundle 'gglanzani/ultisnips-snippets.git'
" Bundle 'Osse/double-tap'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/ctrlp.vim'
" Bundle 'tpope/vim-fugitive'
" Bundle 'ervandew/supertab'
" Bundle 'mileszs/ack.vim'
" Bundle 'vim-scripts/matchit.zip'
" Bundle 'tomtom/tcomment_vim'
" Bundle 'Valloric/MatchTagAlways'
" Bundle 'Raimondi/delimitMate'
" Bundle 'tpope/vim-unimpaired'
Bundle 'Rykka/colorv.vim'


" Bundle 'Align'

" colorschemes:
Bundle 'rey-wright/argokai'
Bundle 'vim-scripts/rootwater.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'tristen/superman'
Bundle 'tomasr/molokai'
Bundle 'toupeira/vim-desertink'
Bundle 'noahfrederick/Hemisu'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on   " required!
syntax enable

let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show absolute line numbers (cf. relativenumber).
set ruler                         " Show cursor position.
set laststatus=2                  " Always show a status line.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set shiftwidth=2                  " 
set tabstop=2                     " Tabs and spaces.
set expandtab                     " 

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " No backups.
set nowritebackup                 " No backups.
set noswapfile                    " No swap files; more hassle than they're worth.

set tildeop                       " Make tilde command behave like an operator.
set shortmess=atI                 " Avoid unnecessary hit-enter prompts.

set noequalalways                 " Resize windows as little as possible.

set autoread                      " Automatically re-read files changed outside Vim.

set notimeout                     " Don't time out partially entered mapped key sequences.
set ttimeout                      " But do time out key codes.

set gdefault                      " Make `substitute` replace all occurrences on a line by default.

se autoindent
set copyindent
set smartindent
se showbreak=↪\  


" I do not want to see any of this stuff when I'm searching for files
se wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
se wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*/.sass-cache/*
se wildignore+=*.swp,*~,._*

" se listchars=precedes:<,extends:>,tab:\|-,trail:· list

set statusline=%F%r%h%w\ 
set statusline+=%{fugitive#statusline()}\    
" set statusline +=%y%*                "file type
" set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline +=%2*%m%*                "modified flag

let mapleader = " "
let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"

let delimitMate_expand_cr = 1

nn <Leader>sh Hmx`` \|:split<CR>`xzt``

nn <leader>ce :ColorVEdit<CR>

" nnoremap <Leader>m :CtrlPMRUFiles<CR>
" nnoremap <Leader>b :CtrlPBuffer<CR>
" nnoremap <Leader>t :CtrlPBufTag<CR>
" nnoremap <Leader>T :CtrlPBufTagAll<CR>


" when splitting a pane vertically, this code
" prevents the panes from scrolling
tabnew
bwipeout

no <Leader>y "*y
no <Leader>p :set paste<CR>"*p:set nopaste<CR>
no <Leader>P :set paste<CR>"*P:set nopaste<CR>

" Window pane navigation shortcut
nn <Leader>h <c-w>h
nn <Leader>j <c-w>j
nn <Leader>k <c-w>k
nn <Leader>l <c-w>l

" window
nn <leader>swh  :topleft  vnew<CR>
nn <leader>swl :botright vnew<CR>
nn <leader>swk    :topleft  new<CR>
nn <leader>swj  :botright new<CR>

" buffer
nn <leader>sh   :leftabove  vnew<CR>
nn <leader>sl  :rightbelow vnew<CR>
nn <leader>sk     :leftabove  new<CR>
nn <leader>sj   :rightbelow new<CR>

" Use CtrlP to manage buffers
nn <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-x> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc

" NerdTree Toggle
nn <Leader>n :NERDTreeToggle<CR>

" UltiSnips Stuff
nn <leader>ue :UltiSnipsEdit<CR>

" Shortcut for Ack
nn <silent> <Leader>f :Ack! 

" move through virtual lines, rows as determined by terminal even if wrapped
nn j gj
nn k gk
" and when those wrapped lines are massive, do this!
nn gj j
nn gk k

" spacebar turns off search highlighting.
nn <silent> <space> :noh<CR>

" Yank to end of line
nn Y y$

" Map colon to semicolon, map semicolon to colon
nn ; :
nn : ;
vn ; :
vn : ;

"finese these timeouts later
:set timeout timeoutlen=500 ttimeoutlen=100

" Map escape to jk
:imap jk <Esc>

" When joining lines, vim adds a space.... I end up removing  that space far too often, so let's override the default" functionality of J
" Also: no gj does not also accomplish this, because if both the lines are indented, the indentation will be carried over
nn jj
nn J Jx

" command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

source ~/.vimrc.local
