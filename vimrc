set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
"Bundle 'klen/python-mode'
"Bundle 'sjl/vitality.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'ivanov/vim-ipython'
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'plasticboy/vim-markdown'
"Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
"Bundle "pangloss/vim-javascript"

filetype plugin indent on

" The rest of your config follows here

" No startup messages
set shm+=atmI 

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ";"

" automatically change window's cwd to file's dir
set autochdir

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

set t_Co=256
set title
set vb

" Enable Wildmenu completion "
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.pyc

set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
set showmatch

set bs=2
set mouse=a
" set columns=80
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set guifont=Inconsolata:h16
set wrapmargin=8
set ruler
set expandtab
set shiftwidth=4
set softtabstop=4
"set autoindent

"" Do not return to start of line
set nostartofline

vnoremap < <gv " better indentation
vnoremap > >gv " same as above

"autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
set number
set cul
syntax on
"command W w !sudo tee % > /dev/null
"command Ioff set noautoindent
"command Ion set autoindent

" Toggle auto-indent before clipboard paste
set pastetoggle=<leader>p

" Enable clipboard support
set clipboard=unnamed

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 78
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%78v.*/
    autocmd FileType python set nowrap
augroup END

" Display invisible characters.
if has("multi_byte")
    set listchars=eol:$,tab:>-,extends:›,precedes:‹,trail:·,nbsp:✂
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
else
    set listchars=tab:>-,extends:>,precedes:<,trail:-,nbsp:%
    endif
set nolist

" Auto comment blocks of text
" ; #python # comments
map ;# :s/^/#/<CR>
" ;/ C/C++/C#/Java // comments
map ;/ :s/^/\/\//<CR>
" ;< HTML comment
map ;< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map ;* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

"Status line
let g:virtualenv_stl_format = '[%n]'
set laststatus=2
set statusline=%{virtualenv#statusline()}\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

"Javascript Syntax Highlighting
let g:used_javascript_libs = 'underscore,backbone, jquery, angularjs, requirejs'

"You Complete Me
"let g:ycm_complete_in_comments = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"Vim-Markdown
let g:vim_markdown_folding_disabled=1

"NERDTree
nmap <leader>n :NERDTreeToggle <cr>
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Open NERDTree in same dir
let NERDTreeChDirMode=1
" Show hidden files by default
let NERDTreeShowHidden=1

"" Set GUI Options and scrollbars
set guioptions=egmrLtTb

"" Remove the 'tear bla bla from menus'
set guioptions-=t

" Keep undo history across sessions, by storing in file.
set undodir=~/.vimundo
set undofile

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python<CR>
nnoremap _js :set ft=javascript<CR>
