"Rainbow Parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Disable delimiteMate for vimrc
autocmd FileType vim let b:delimitMate_autoclose = 0 
    
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
let g:UltiSnipsListSnippets = '<c-l>'
"let g:UltiSnips_ExpandSnippetOrJump = '<tab>'
"let g:UltiSnipsSnippetDirectories = ['.snippets', 'snippets']

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

"Brolink
let g:bl_no_implystart = 1 " Disable autostart of Brolink
"au InsertLeave *.css :BLReloadCSS
"au InsertLeave *.html :BLReloadPage

" Vim Slime
let g:slime_target = "screen"
"let g:slime_paste_file = "/tmp/vim-slime"
let g:slime_paste_file = tempname()

