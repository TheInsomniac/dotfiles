" Rebind <Leader> key
let mapleader = ";"

" Map CTRL-W to toggle wrapping
nnoremap <silent> <C-w> :set wrap!<CR>
inoremap <silent> <C-w> :set wrap!<CR>

" Map CTRL-S to save buffer
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> :w<CR>
" Map CTRL-Q to quit
nnoremap <silent> <C-q> :q<CR>
inoremap <silent> <C-q> :q<CR>

vnoremap < <gv " better indentation
vnoremap > >gv " same as above

" Allow writing file as root user using W instead of w
command! W w !sudo tee % > /dev/null

" Clear Search Highlight on _
nnoremap <silent> _ :nohl<CR>

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

" force dd to not copy text to register/clipboard
noremap dd "_dd"

" Yank from the cursor to the end of the line, to be consistent
" with C and D
nnoremap Y y$

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

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python<CR>
nnoremap _js :set ft=javascript<CR>
