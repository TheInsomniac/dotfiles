set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'klen/python-mode'
Bundle 'sjl/vitality.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'ivanov/vim-ipython'
"Bundle 'jelera/vim-javascript-syntax'
"Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'plasticboy/vim-markdown'
"Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle "pangloss/vim-javascript"

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

"set hlsearch
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

" Python-mode
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
""let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checker = "pyflakes"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" python-mode rope settings
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences

" Load rope plugin
let g:pymode_rope = 0
" Remap <Ctrl-c>g for definitions to <leader>g
""map <Leader>g :call RopeGotoDefinition()<CR>
" Auto create and open ropeproject
let g:pymode_rope_auto_project = 0
" Enable autoimport
let g:pymode_rope_enable_autoimport = 0
" Auto generate global cache
let g:pymode_rope_autoimport_generate = 0
let g:pymode_rope_autoimport_underlineds = 0
let ropevim_enable_shortcuts = 1
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 0
let g:pymode_rope_extended_complete = 0
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 0
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-c>r"
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_guess_project = 0
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_always_show_complete_menu = 0

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

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
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

"Vim-Markdown
let g:vim_markdown_folding_disabled=1

"NERDTree
nmap <leader>n :NERDTreeToggle <cr>
