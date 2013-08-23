set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
" Auto close most tags
Bundle 'Raimondi/delimitMate'
" Auto close html tags
Bundle 'docunext/closetag.vim'
" Support python virtualenvs
Bundle 'jmcantrell/vim-virtualenv'
" javascript syntax highlighting
Bundle 'othree/javascript-libraries-syntax.vim'
" Awesome auto completion for most languages
Bundle 'Valloric/YouCompleteMe'
" Syntax Checker
Bundle 'scrooloose/syntastic'
" Markdown Highlighting
Bundle 'tpope/vim-markdown'
" Tabular formatting 
Bundle 'godlygeek/tabular'
" Highlight/flash matching tags
Bundle 'Valloric/MatchTagAlways'
" Show installed bundles in MacVim/GVim
Bundle 'mbadran/headlights'
" JSON syntax highlighting & prettyfying
Bundle 'elzr/vim-json'
" Emmet html snippet support
Bundle 'mattn/emmet-vim'
" Jade Templating Support
Bundle 'digitaltoad/vim-jade'
" Stylus (CSS) support
Bundle 'wavded/vim-stylus'
" Pretty Status Bars
Bundle 'bling/vim-airline'
" Git Support
Bundle 'tpope/vim-fugitive'
" HTML & CSS Live Preview
Bundle 'manxam/brolink.vim'
" Updated netrw (Vim's native filemanager)
Bundle 'eiginn/netrw'
" jQuery syntax highlighting
"Bundle 'itspriddle/vim-jquery'
" Coffeescript highlighting
Bundle 'kchmck/vim-coffee-script'
" Run a terminal within Vim
Bundle 'vim-scripts/Conque-Shell'
" Javascript completion
Bundle 'marijnh/tern_for_vim'
" Show indent guides
Bundle 'nathanaelkane/vim-indent-guides'
" Display CTERMBG and GUIBG color pallete
Bundle 'guns/xterm-color-table.vim'
" Snipmate / snippet support
Bundle 'SirVer/ultisnips'
" Display git status in gutter
Bundle 'mhinz/vim-signify'
" Match parentheses in specific colors
Bundle 'kien/rainbow_parentheses.vim'
" Node.JS support
Bundle 'moll/vim-node'
" Sublime Text type multiple cursors
Bundle 'terryma/vim-multiple-cursors'

filetype plugin indent on

" The rest of your config follows here

" No startup messages
set shm+=atmI 

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ";"

" Map CTRL-S to save buffer
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> :w<CR>
" Map CTRL-Q to quit
nnoremap <silent> <C-q> :q<CR>
inoremap <silent> <C-q> :q<CR>

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
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.pyc

set hlsearch
" Clear Search Highlight on _
nnoremap <silent> _ :nohl<CR>
set incsearch
set wrapscan
set ignorecase
set smartcase
set showmatch

set bs=2
set mouse=a
" set columns=80
set tw=80
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
colorscheme molokai
let g:rehash256=1
"let g:molokai_original=1
set guifont=Inconsolata\ for\ Powerline:h18
set wrapmargin=8
set ruler
set expandtab
set shiftwidth=2
set softtabstop=2
"set autoindent
set backspace=indent,eol,start 

"" Do not return to start of line
set nostartofline

vnoremap < <gv " better indentation
vnoremap > >gv " same as above

set number
set cul
syntax on

" Enable sudo writing of files
command! W w !sudo tee % > /dev/null

" Toggle auto-indent before clipboard paste
set pastetoggle=<leader>p
" Enable OSX Terminal/iTerm2 paste ability
if exists('$ITERM_PROFILE') || exists('$TMUX')
  let &t_ti = "\<Esc>[?2004h" . &t_ti
  let &t_te = "\<Esc>[?2004l" . &t_te

  function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction

  execute "set <f28>=\<Esc>[200~"
  execute "set <f29>=\<Esc>[201~"
  map <expr> <f28> XTermPasteBegin("i")
  imap <expr> <f28> XTermPasteBegin("")
  vmap <expr> <f28> XTermPasteBegin("c")
  cmap <f28> <nop>
  cmap <f29> <nop>
end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy paste system clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
map <leader>p "*p
map <leader>P "*P

" Enable clipboard support
set clipboard=unnamed
" force dd to not copy text to register/clipboard
noremap dd "_dd"
" Yank from the cursor to the end of the line, to be consistent
" with C and D
nnoremap Y y$

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 78
    autocmd FileType * highlight Excess ctermbg=237 guibg=#3a3a3a
    autocmd FileType * match Excess /\%78v.*/
    " Remove trailing whitespace automagically
    autocmd BufWritePre *.rb,*.coffee,*.js :%s/\s\+$//e
    "Python
    "autocmd FileType python set softtabstop=4 | set shiftwidth=4
    " Disable delimiteMate for vimrc
    autocmd FileType vim let b:delimitMate_autoclose = 0 
    "Rainbow Parentheses
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
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
" ;" vim " comments
map <leader>" :s/^/"/<CR>
map <leader>-" :s/"//<CR>
" ;# python # comments
map <leader># :s/^/#/<CR>
map <leader>-# :s/#//<CR>
" ;/ C/C++/C#/Java // comments
map <leader>/ :s/^/\/\//<CR>
" ;< HTML comment
map <leader>< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map <leader>* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

"Status line
"let g:virtualenv_stl_format = '[%n]'
"set statusline=%{virtualenv#statusline()}\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set laststatus=2
set noshowmode

" Vim Airline statusline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline_detect_whitespace=0 "disabled"
let g:airline_theme='bubblegum'
let g:airline_detect_modified=1
let g:airline_enable_syntastic = 0
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '

"Javascript Syntax Highlighting
let g:used_javascript_libs = 'underscore,backbone, jquery, angularjs, requirejs'

"You Complete Me
"let g:ycm_complete_in_comments = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" NETRW
" Toggle Vexplore with ;n
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <leader>n :call ToggleVExplorer()<CR>
let g:netrw_browse_split = 3
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 1
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

"" Set GUI Options and scrollbars
set guioptions=eg

"" Remove the 'tear bla bla from menus'
set guioptions-=t

"" Add window transparency
set transparency=10

" Keep undo history across sessions, by storing in file.
if !isdirectory(expand('~/.vimundo'))
  call mkdir(expand('~/.vimundo'), 'p', 0700)
endif
set undodir=~/.vimundo
set undofile
"set viminfo+=n~/.viminfo

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python<CR>
nnoremap _js :set ft=javascript<CR>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" Markdown
"vmap startmd :StartMarkdownServer
"vmap stopmd :StopMarkdownServer
" Open current markdown file in marked.app
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>:redraw!<cr>

" Syntastic
let g:syntastic_check_on_open = 1
 " Put errors on left side
let g:syntastic_enable_signs = 1
" Only open location list when asked 
let g:syntastic_auto_loc_list = 2
" Popup on mouse hover
let g:syntastic_enable_balloons = 1
" Only 5 lines in loc_list
let g:syntastic_loc_list_height=5
" Add Syntastic error messages to the status bar
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_python_checkers=['pylint']
if has('unix')
    let g:syntastic_error_symbol = '⭑'
    let g:syntastic_style_error_symbol = '>'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_warning_symbol = '>'
else
    let g:syntastic_error_symbol = '!'
    let g:syntastic_style_error_symbol = '>'
    let g:syntastic_warning_symbol = '.'
    let g:syntastic_style_warning_symbol = '>'
endif

" File tabs
"nmap <leader>t :tabnew<CR>
"imap <leader>t <ESC>:tabnew<CR>

" Emmet Completion
" let <leader>e complet emmet snippets in case the below doesn't work
" for some really nested tags
imap <leader>e <C-y>,
" Enable tab to complete emmet snippets
function! s:emmet_html_tab()
    let line = getline('.')
    if match(line, '<.*>') >= 0
        return "\<C-y>n"
    endif
    return "\<C-y>,"
endfunction
autocmd FileType html imap <buffer><expr><tab> <sid>emmet_html_tab()

" Relative Numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"Closetags
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"Conque Shell
function! s:Terminal()
  execute 'ConqueTermSplit bash --login'
endfunction
command! Term call s:Terminal()

"Indent Guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3a3a3a ctermbg=237
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"UltiSnip
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsSnippetDirectories = ['.snippets', 'snippets']

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ] 
let g:signify_sign_overwrite = 0
highlight link SignifySignAdd    DiffAdd
highlight link SignifySignChange DiffChange
highlight link SignifySignDelete DiffDelete
highlight SignifySignAdd    cterm=bold ctermbg=235  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=235  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=235  ctermfg=227

" Tern
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" Decrease escape timeout
"if ! has('gui_running')
"    set ttimeoutlen=30
augroup FastEscape
  autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
"endif

"Brolink
let g:bl_no_implystart = 1 " Disable autostart of Brolink
"au InsertLeave *.css :BLReloadCSS
"au InsertLeave *.html :BLReloadPage
