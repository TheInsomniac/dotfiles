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
"map <leader>" :s/^/"/<CR>
"map <leader>-" :s/"//<CR>
" ;# python # comments
"map <leader># :s/^/#/<CR>
"map <leader>-# :s/#//<CR>
" ;/ C/C++/C#/Java // comments
"map <leader>/ :s/^/\/\//<CR>
"map <leader>-/ :s/^\/\///<CR>
" ;< HTML comment
"map <leader>< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
"map <leader>* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

" Comment using tComment
nnoremap <leader># :TComment<CR>
inoremap <leader># :TComment<CR>
vnoremap <leader># :TCommentBlock<CR>

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python<CR>
nnoremap _js :set ft=javascript<CR>

" ------------------------------------------------------------------------------
" Auto-closing pairs
" ------------------------------------------------------------------------------

" Define some pair types (currently only used when deleting).
let g:autopairs = ['(:)', '[:]', '{:}', '":"', "':'", '<:></>', '<:>', '{% : %}', '{{ : }}', '<% : %>', '<%= : %>']

" Pairing for basic brace types (round, square & curly).
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Angle-brackets are more likely to appear individually than other brace
" types (as less-than & greater-than) so don't auto-close them by default.
" But do provide leader combos for creating tags (standard & self-closing).
inoremap <leader><lt> <lt>><lt>/><left><left><left><left>
inoremap <leader>> <lt>><left>

" Gracefully handle over-writing of auto-closed pairs.
inoremap <expr> ) ClosePair(')')
inoremap <expr> ] ClosePair(']')
inoremap <expr> } ClosePair('}')
inoremap <expr> > ClosePair('>')

" Quotes are a bit more complicated.
inoremap <expr> " CloseQuote('"')
inoremap <expr> ' CloseQuote("'")

" Non-auto-closing mappings for convenience.
inoremap <leader>( (
inoremap <leader>[ [
inoremap <leader>{ {
inoremap <leader>" "
inoremap <leader>' '

" Wrap visual selections (using leader to avoid conflict with motions, etc)
vnoremap <leader>( s()<left><c-r>"<esc>
vnoremap <leader>[ s[]<left><c-r>"<esc>
vnoremap <leader>{ s{}<left><c-r>"<esc>
vnoremap <leader>" s""<left><c-r>"<esc>
vnoremap <leader>' s''<left><c-r>"<esc>
vnoremap <leader><lt> s<lt>></><left><left><left><c-r>"<esc>`[<left>i
vnoremap <leader>> s<lt>><left><c-r>"<esc>

" Delete auto-pairs as quickly as you can create them.
inoremap <expr> <bs> DeleteEmptyPair()
" Return inside an auto-pair snaps it open and indents.
inoremap <expr> <cr> SplitEmptyPair()

augroup mt_pairs
    autocmd!

    " Add mappings for django template tags.
    autocmd Filetype html,django inoremap <buffer> <leader>{ {{<space><space>}}<left><left><left>
    autocmd Filetype html,django inoremap <buffer> <leader>% {%<space><space>%}<left><left><left>
    " And some for rails / erb.
    autocmd Filetype html,eruby,ejs inoremap <buffer> <leader>% <%<space><space>%><left><left><left>
    autocmd Filetype html,eruby,ejs inoremap <buffer> <leader>= <%=<space><space>%><left><left><left>

    " Auto-complete html end tags based on edits to the start tag.
    autocmd CursorMovedI * call CompleteTag()
augroup END


" ------------------------------------------------------------------------------
" A library of functions supporting the auto-pair mappings above.
" ------------------------------------------------------------------------------

func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<right>"
    else
        return a:char
    endif
endf

func! CloseQuote(char)
    let row = getline('.')
    let col = col('.')

    let prev = row[col - 2]
    let next = row[col - 1]

    if prev == "\\"
        " Inserting a quoted quotation mark into the string.
        return a:char
    elseif a:char == "'" && next != a:char && IsAlpha(prev)
        " Probably just want an apostrophe.
        return a:char
    elseif next == a:char
        " Closing the pair, just move the cursor.
        return "\<right>"
    else
        " Opening a pair, auto-close it.
        return a:char.a:char."\<left>"
    endif
endf 

func! IsAlpha(c)
    let n = char2nr(a:c)
    if (n >= 65 && n <= 90) || (n >= 97 && n <= 122)
        return 1
    else
        return 0
    endif
endf

func! InAnEmptyPair(pairs)
    let cur = strpart(getline('.'), col('.')-2, 2)
    for pair in a:pairs
        if cur == join(split(pair,':'),'')
            return 1
        endif
    endfor
    return 0
endf

func! InASplitPair(pairs)
    let row = line('.')
    let prev_row = getline(row - 1)
    let curr_row = getline(row)
    let next_row = getline(row + 1)
    for pair in a:pairs
        let a = pair[0]
        let b = pair[2]
        if match(prev_row, a . '\s*$') != -1 && match(curr_row, '^\s*$') != -1 && match(next_row, '^\s*' . b) != -1
            return 1
        endif
    endfor
    return 0
endf

func! SurroundingTag()
    let [row_a, col_a] = searchpos('<','nbW')
    let [row_b, col_b] = searchpos('>','ncW')

    if row_a && row_b
        let lines = getline(row_a, row_b)
        let lines[0] = strpart(lines[0], col_a - 1)
        let lines[-1] = strpart(lines[-1], 0, col_b)

        return join(lines, "\n")
    else
        return ''
    endif
endf

func! InAnEmptyTag()
    return -1 < match(SurroundingTag(), '<\(\w*\)[^>]*><\/\1>')
endf

func! InASplitTag()
    return -1 < match(SurroundingTag(), '<\(\w*\)[^>]*>\n\s\+\n\s*<\/\1>')
endf

func! DeleteEmptyPair()
    let pairs = split(&matchpairs,',') + ['<:>','":"',"':'"]
    if InASplitPair(pairs) || InASplitTag()
        return "\<esc>kJJhxi"
    " elseif InAnEmptyTag()
    "     return "\<left>"
    else

        let line_str = getline('.')
        let c = col('.')
        for pair in g:autopairs
            let pair_arr = split(pair, ':')
            let pair_a = pair_arr[0]
            let pair_b = pair_arr[1]
            let pair_str = join(pair_arr, '')

            let curr_a = strpart(line_str, c - 1 - len(pair_a), len(pair_a))
            let curr_b = strpart(line_str, c - 1, len(pair_b))

            if curr_a == pair_a && curr_b == pair_b
                return "\<c-o>" . len(curr_a) . "X" . "\<c-o>" . len(curr_b) . "x"
            endif
        endfor

        return "\<bs>"

    endif
endf

func! SplitEmptyPair()
    let pairs = split(&matchpairs,',') + ['<:>','":"',"':'"]
    if InAnEmptyPair(pairs) || InAnEmptyTag()
        " return "\<cr>\<cr>\<up>\<tab>"
        return "\<c-o>x\<cr>\<c-r>\"\<left>\<cr>\<up>\<tab>"
    else
        return "\<cr>"
    endif
endf

func! CompleteTag()
    let line = getline('.')
    let col = col('.')
    if line[col - 1] == '>'
        let line_a = strpart(line, 0, col)
        let line_a_idx = strridx(line_a, '<')
        let line_a = strpart(line_a, line_a_idx)

        let line_b = strpart(line, col)
        let line_b_idx = stridx(line_b, '>') + 1
        let line_b = strpart(line_b, 0, line_b_idx)

        let old_tag = line_a . line_b
        if match(old_tag, '^<[^/> ]*>.*</[^>]*>$') != -1
            let new_tag = substitute(old_tag, '^<\([^/> ]*\)>\(.*\)</[^>]*>$', '<\1>\2</\1>', '')
            let line = strpart(line, 0, line_a_idx) . new_tag . strpart(line, line_a_idx + strlen(old_tag))
            call setline('.', line)
        endif
    endif
endf
