set nocompatible
filetype off

" Enable vundle support
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" load bundles from bundles.vim
" Keep here instead of loading with external configs at bottom as these need
" to proceed the 'filetype plugin indent on' setting
source $HOME/.vim/bundles.vim

filetype plugin indent on

" Supported file formats
set fileformats=unix,dos,mac

" No startup messages
set shm+=atmI 

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" automatically change window's cwd to file's dir
set autochdir

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Keep undo history across sessions, by storing in file.
if !isdirectory(expand('~/.vimundo'))
  call mkdir(expand('~/.vimundo'), 'p', 0700)
endif
set undodir=~/.vimundo
set undofile
"set viminfo+=n~/.viminfo

" Enable 256 color support
set t_Co=256
" Enable terminal titles
set title
" Visual Bel
set vb

" Enable Wildmenu completion "
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=*/node_modules/*
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.pyc

" Highlight Search Results
set hlsearch

" Incremental Search
set incsearch
" Wrap Search
set wrapscan
" Ignore [Cc]ase
set ignorecase
set smartcase
" Show matching brackets
set showmatch

" Enable Mouse support in terimal
set mouse=a

" set columns=80
set tw=80
" Create a colored column @ line 80
set colorcolumn=80
highlight ColorColumn ctermbg=233
" Don't wrap lines
set nowrap
" When using wrap (CTRL-W or :set wrap!). Wrap at word boundaries
set linebreak 
" highlight characters past column 78
autocmd FileType * highlight Excess ctermbg=237 guibg=#3a3a3a
autocmd FileType * match Excess /\%78v.*/

" Visual Block Move Mode
runtime plugin/dragvisuals.vim
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1 

" Disable folding
set fo-=t

set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
colorscheme molokai
let g:rehash256=1
"let g:molokai_original=1
set guifont=Inconsolata\ for\ Powerline:h18

" Show row/column in status bar
set ruler

" Make tab button insert 2 spaces instead
set expandtab
set shiftwidth=2
set softtabstop=2
" Make backspace honour the spaces 
set backspace=indent,eol,start 

" Do not return to start of line when traversing line
set nostartofline

" Show column numbers
set number
set relativenumber
" Relative Numbers off during insert. On otherwise
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Highlight current line
set cul
" Syntax highlighting
syntax on

" Enable clipboard support
set clipboard=unnamed

" Remove trailing whitespace automagically
autocmd BufWritePre *.rb,*.coffee,*.js :%s/\s\+$//e

" Display invisible characters.
if has("multi_byte")
    set listchars=eol:$,tab:>-,extends:›,precedes:‹,trail:·,nbsp:✂
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
else
    set listchars=tab:>-,extends:>,precedes:<,trail:-,nbsp:%
    endif
set nolist

"Status line
"let g:virtualenv_stl_format = '[%n]'
"set statusline=%{virtualenv#statusline()}\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set laststatus=2
set noshowmode

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Decrease escape timeout
"if ! has('gui_running')
"    set ttimeoutlen=30
"augroup FastEscape
"  autocmd!
"    au InsertEnter * set timeoutlen=0
"    au InsertLeave * set timeoutlen=1000
"augroup END
"endif

 " GUI Options {

" Set GUI Options and scrollbars
set guioptions=eg
" Remove the 'tear bla bla from menus'
set guioptions-=t
" Add window transparency
if has('gui_running')
  set transparency=10
endif

" Add menu Tab
amenu <silent> T&abs.&New :confirm tabnew<cr>
amenu <silent> T&abs.&Previous :tabprevious<cr>
amenu <silent> T&abs.Ne&xt :tabnext<cr>
amenu <silent> T&abs.&Delete :confirm tabclose<cr>

 " }

 " External Configuration Files {

" load bundles from bundles.vim
"source $HOME/.vim/bundles.vim

" load key mappings from mappings.vim
source $HOME/.vim/mappings.vim

" load plugin settings from plugins.vim
source $HOME/.vim/plugins.vim

 " }
