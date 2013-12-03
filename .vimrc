" Brought to you by Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'CycleColor'
Bundle 'Rykka/colorv.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'dahu/LearnVim'
Bundle 'dahu/vim_waz_ere'
Bundle 'ingo-library'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-arpeggio'
" Bundle 'kana/vim-smartinput'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'rey-wright/ultisnips-snippets.git'
Bundle 'sheerun/vim-polyglot'
Bundle 'sjl/gundo.vim'
Bundle 'takac/vim-hardtime'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/matchit.zip'
Bundle 'osyo-manga/vim-over'
" Bundle 'liujoey/vim-easymotion'
" Bundle 'Shougo/neocomplete.vim'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'rstacruz/vim-ultisnips-css'
" Bundle 'stephenmckinney/ultisnips-snippets'
" Bundle 'rhysd/clever-f.vim'
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'bling/vim-airline'
" Bundle 'ervandew/supertab'
" Bundle 'vim-scripts/AutoComplPop'
" Bundle 'mhinz/vim-signify'
" Bundle 'vim-scripts/svndiff'

" colorschemes:
Bundle 'rey-wright/argokai'
Bundle 'Pychimp/vim-luna'
Bundle 'altercation/vim-colors-solarized'
Bundle 'baskerville/bubblegum'
Bundle 'bclear'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/seoul256.vim'
" Bundle 'chriskempson/base16-vim'
" Bundle 'summerfruit256.vim'
" Bundle 'w0ng/vim-hybrid'

"Enable file type detection and load plugin indent files
filetype plugin on
filetype plugin indent on   " required!

" Set <space> as <leader> instead of default backslash
let mapleader = " "


" =============================================================================
" Editing
" =============================================================================

""
"" Whitespace
""

set expandtab                           "
set tabstop=4                           " Tabs and spaces.
set shiftwidth=4                        "
set softtabstop=4
set autoindent

" Backspace over everything in insert mode
set backspace=indent,eol,start

" Invisible characters
"set listchars=tab:▸\ ,nbsp:_
"set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set list
set listchars=tab:▸\ ,trail:·,nbsp:_,extends:❯,precedes:❮


""
"" Wrapping
""

set nowrap  " Turn off line wrapping.
set showbreak=↪\  " Character to precede line wraps


" Always move down and up by display lines instead of real lines
nnoremap <silent>j gj
nnoremap <silent>k gk
" and when those wrapped lines are massive, do this!
nnoremap gj j
nnoremap gk k

""
"" Joining
""

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces


""
"" Other
""

" Don't reset cursor to start of line when moving around
set nostartofline

" Do not jump to the matching bracket upon bracket insert (default)
set noshowmatch


" =============================================================================
" Appearance
" =============================================================================

set cursorline      " Highlight current line
set scrolloff=5     " Keep more buffer context when scrolling
set showtabline=2   " Always show the tab bar
set cmdheight=1     " Set command line height (default)
set title           " Show the filename in the window titlebar
set t_Co=256        " 256 colors
set background=dark " Dark background
syntax on           " Enable syntax highlighting
set noerrorbells    " Disable error bells
set shortmess=atI   " Don't show the Vim intro message
set number          " Show line numbers
set relativenumber
set laststatus=2    " Always show a status line.
set statusline=%t\ %<\ %m%r%y


" =============================================================================
" Command Line
" =============================================================================


" Display incomplete commands below the status line
set showcmd

" Default shell and shell syntax
set shell=bash
let g:is_bash=1

" Remember more commands and search history (default: 20)
set history=100

" Set <c-n> and <c-p> to act like Up/Down so will filter command history
" Practical Vim p.69
" cnoremap <c-p> <up>
" cnoremap <c-n> <down>

" <c-a> jumps to beginning of line to match <c-e>
cnoremap <c-a> <home>

" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>"

""
""  Wildmode
""

" Make tab completion for files/buffers act like bash
set wildmenu

" Use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore node modules
set wildignore+=node_modules/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*


""
""  Search
""

" set hlsearch   " Highlight searches
set incsearch  " Highlight dynamically as pattern is typed
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character
set gdefault   " Use global search by default

" Clear last search highlighting with enter and clear the command line
" function! MapCR()
"   nnoremap <cr> :nohlsearch<cr>:<backspace>
" endfunction
" call MapCR()

" Re-highlight last search pattern
nnoremap <leader>hs :set hlsearch<cr>


" =============================================================================
" Buffers
" =============================================================================

" Allow unsaved background buffers and remember marks/undo for them
set hidden

" Jump to the first open window that contains the specified buffer
set switchbuf=useopen

" Auto-reload buffers when files are changed on disk
set autoread

" Toggle current and alternate buffers
nnoremap <leader><leader> <c-^>

" =============================================================================
" Windows
" =============================================================================

" Split windows below and right instead of above and left
set splitbelow splitright

" get native functionality, use the maps provited
cabbrev vsl lefta vs
cabbrev spt abo sp

" Window pane navigation shortcut
nn <Leader>h <c-w>h
nn <Leader>j <c-w>j
nn <Leader>k <c-w>k
nn <Leader>l <c-w>l

" =============================================================================
" Registers
" =============================================================================

" Use the OS clipboard by default
" set clipboard=unnamed

" Copy to X11 primary clipboard
" map <leader>y "*y

" Paste from unnamed register and fix indentation
" nmap <leader>p pV`]=


" =============================================================================
" Backup
" =============================================================================

" Don't make a backup before overwriting a file
set nobackup
set nowritebackup

" Disable swap files
set updatecount=0

" =============================================================================
" Filetypes and Custom Autocmds
" =============================================================================

" set fileformats=unix,dos,mac

augroup vimrcEx
  " Clear all autocmds for the current group
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler or
  " a git commit
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Some file types use real tabs
  au FileType {make,gitconfig} set noexpandtab sw=4

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  " Make Python follow PEP8
  au FileType python set sts=4 ts=4 sw=4 tw=79

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there
  au! CmdwinEnter * :unmap <cr>
  au! CmdwinLeave * :call MapCR()
augroup END

" =============================================================================
" Plugin Settings and Mappings
" =============================================================================


""
"" indentLine
""

let g:indentLine_faster = 1
let g:indentLine_fileType = ['html', 'htmldjango']

""
"" Emmet
""

" let g:user_emmet_leader_key = '<tab>'
let g:user_emmet_install_global = 0
" autocmd FileType html,htmldjango,css,scss,sass EmmetInstall

" autocmd FileType html,htmldjango,css,scss,sass imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

""
"" Fugitive
""

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Git status -sb<cr>

""
"" Matchit
""

" Enable Matchit to use % to jump between def/end, if/else/end
runtime macros/matchit.vim


" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1


" Ultisnips
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips-snippets/my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
nn <leader>ue :UltiSnipsEdit<CR>

" ColorV
nn <leader>ce :ColorVEdit<CR>
let g:colorv_preview_ftype = 'css,html,javascript,sass'

" Hardtime
let g:hardtime_default_on = 1

" ZenCoding
" let g:user_zen_leader_key = '<leader>y'

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

" Arpeggio
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" BufOnly
nn <Leader>cb :BufOnly<CR>:bd <cr>

" Ack
nn <Leader>f :Ack!<space>


" using this to get line autocompletion to not automatically select the first option
" set cot+=longest

let g:svndiff_autoupdate = 1

let g:SuperTabCrMapping = 0


" http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html
" Vim’s default indentation for HTML has a pretty severe quirk:
" When you press return after a tag  already created Vim will unindent the new line and the previous line.
" With the following line, pressing the return key will only set the indentation on the newly created line.
autocmd FileType html setlocal indentkeys-=*<Return>

nnoremap <SPACE> <Nop>

" Save files easier
nn <leader>w <esc>:w<cr>


" Split a line
" nn <leader>e i<CR><ESC>k$

function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction
"delete the current file
com! Rm call DeleteFile()
"delete the file and quit the buffer (quits vim if this was the last file)
com! RM call DeleteFile() <Bar> q!

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


" remove trailing whitespace
nn <leader>r :%s/\s\+$//<CR>

" backspace turns off search highlighting.
" nn <silent> <BS> :nohls<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Yank to end of line
nn Y y$

" Map colon to semicolon, map semicolon to colon
nn ; :
nn : ;
vn ; :
vn : ;

" Map escape to jk
" :imap jk <Esc><Esc>
" :inoremap jk <esc><esc>

cmap w!! w !sudo tee % >/dev/null


set nrformats=                          " This will cause Vim to treat all numerals
                                        " As decimal, regarless whether they are
                                        " padded with zeros.

set visualbell                          " No beeping.


set tildeop                             " Make tilde command behave like an operator.

set notimeout                           " Don't time out partially entered mapped key sequences.
set ttimeout                            " But do time out key codes.
set noequalalways

colo argokai

source ~/.vimrc.local
