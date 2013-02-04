" Brought to you by Vundle
set nocp
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

My Bundles here:
Bundle "vim-scripts/UltiSnips"
Bundle 'rey-wright/ultisnips-snippets.git'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tomtom/tcomment_vim'
Bundle 'Valloric/MatchTagAlways'
Bundle 'Raimondi/delimitMate'
" Bundle 'skammer/vim-css-color'
Bundle 'Rykka/colorv.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'sjl/gundo.vim'
Bundle 'dahu/LearnVim'

" colorschemes:
Bundle 'rey-wright/argokai'
" Take the diff colors then delete hybrid
Bundle 'w0ng/vim-hybrid'
Bundle 'noahfrederick/Hemisu'

" powerline color schemes
Bundle 'zaki/zazen-powerline'

filetype plugin indent on   " required!
syntax enable

set background=light "for Hemisu
set showcmd                             " Display incomplete commands.
set showmode                            " Display the mode you're in.

set backspace=indent,eol,start          " Intuitive backspacing.

set hidden                              " Handle multiple buffers better.

set wildmenu                            " Enhanced command line completion.
set wildmode=list:longest               " Complete files like a shell.

set ignorecase                          " Case-insensitive searching.
set smartcase                           " But case-sensitive if expression contains a capital letter.

set number                              " Show absolute line numbers (cf. relativenumber).
set ruler                               " Show cursor position.
set laststatus=2                        " Always show a status line.

set incsearch                           " Highlight matches as you type.
set hlsearch                            " Highlight matches.

set nowrap                              " Turn off line wrapping.
" set scrolloff=3                       " Show 3 lines of context around the cursor.

set shiftwidth=4                        "
set tabstop=4                           " Tabs and spaces.
set expandtab                           "

set nrformats=                          " This will cause Vim to treat all numerals
                                        " As decimal, regarless whether they are
                                        " padded with zeros.

set title                               " Set the terminal's title

set visualbell                          " No beeping.

set nobackup                            " No backups.
set nowritebackup                       " No backups.
set noswapfile                          " No swap files; more hassle than they're worth.

set tildeop                             " Make tilde command behave like an operator.
set shortmess=atI                       " Avoid unnecessary hit-enter prompts.

set autoread                            " Automatically re-read files changed outside Vim.

set notimeout                           " Don't time out partially entered mapped key sequences.
set ttimeout                            " But do time out key codes.
set noequalalways


set nojoinspaces                        " this SHOULD replace the mapping I made above

set autoindent
set copyindent
set showbreak=↪\
set splitright                          " The active split is now on the right / bottom for
set splitbelow                          " vertical / horizontal splits respectively. To
cabbrev vsl lefta vs                    " get native functionality, use the maps provited
cabbrev spt abo sp

" I do not want to see any of this stuff when I'm searching for files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*/.sass-cache/*
set wildignore+=*.php*
set wildignore+=*.swp,*~,._*

set list
set listchars=precedes:<,extends:>,tab:\|-,trail:· list

" Tim pope says it's a smart default?
" I guess I'll play with it, make a decision
" later.
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

let g:SuperTabCrMapping = 0

" Delimitmate
let delimitMate_expand_cr = 1

nnoremap <SPACE> <Nop>
let mapleader = " "

" Save files easier
nn <leader>w <esc>:w<cr>

" Tabularize
vn <leader>t :Tabularize /

" Window pane navigation shortcut
nn <Leader>h <c-w>h
nn <Leader>j <c-w>j
nn <Leader>k <c-w>k
nn <Leader>l <c-w>l

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'zazen'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Ultisnips
let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
nn <leader>ue :UltiSnipsEdit<CR>

" ColorV
nn <leader>ce :ColorVEdit<CR>

" Gundo
nn <leader>u :GundoToggle<CR>

" CtrlP
nn <Leader>m :CtrlPMRUFiles<CR>
nn <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
" Let the root be the working directory... don't let ctrl + p decide based on
" repo (or however it figures that out)
let g:ctrlp_working_path_mode = 0
func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc
func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc


" This utilizes the power of BufOnly: basically if :qa throws
" errors, close all non-modified buffers (including the
" current buffer)
function! ElegantClose()
    try
        execute "qa"
        let yes = 1
    catch /^Vim\%((\a\+)\)\=:E37/
            execute "BufOnly"
            execute "bd"
    endtry
endfunction
cabbrev qa call ElegantClose()

" This is for creating / debugging colorschemes
nn <leader>x :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" NerdTree Toggle
nn <Leader>n :NERDTreeToggle<CR>

" BufOnly
nn <Leader>cb :BufOnly<CR>:bd <cr>

" Ack
nn <Leader>f :Ack!

" move through virtual lines, rows as determined by terminal even if wrapped
nn j gj
nn k gk
" and when those wrapped lines are massive, do this!
nn gj j
nn gk k

" backspace turns off search highlighting.
nn <silent> <BS> :nohls<CR>

" Yank to end of line
nn Y y$

" Map colon to semicolon, map semicolon to colon
nn ; :
nn : ;
vn ; :
vn : ;

" Map escape to jk
:imap jk <Esc><Esc>
:inoremap jk <esc><esc>

" command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

source ~/.vimrc.local
