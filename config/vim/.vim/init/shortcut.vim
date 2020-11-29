" shortcut.vim

" push Esc twice, stop hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" add new line into normal mode with Enter
" under
noremap <CR> $i<Right><CR><ESC>
" above
noremap <S-CR> $i<Up><CR><ESC>

" add space into normal mode with space
noremap <Space> i<Space><ESC>

inoremap <C-c> <Esc>

" Save using Ctrl + s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i<Right>

" autosave
inoremap <Esc> <Esc>:w<CR>
