" tried.vim

" moving into insert mode
" imap <C-p> <Up>
" imap <C-n> <Down>
" imap <C-f> <Left>
" imap <C-b> <Right>

" 直前のバッファを開く
" nnoremap <silent>bb :b#<CR>
" nnoremap <silent>bf :bfirst<CR>
" nnoremap <silent>bl :blast<CR>

" auto reload .vimrc 
" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
" augroup END

" auto load .vimrc 
" augroup vimenter-vimrc
"     autocmd!
"     autocmd BufNewFile, BufRead *.css source $MYVIMRC 
"     autocmd VimEnter * source $MYVIMRC

" augroup END

" autocmd BufNewFile,BufRead * source ~/.vimrc
