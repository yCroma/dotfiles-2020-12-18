" move.vim

" move carsol like physics
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" move window forword key"
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" move buffer
nnoremap <c-i> :bprevious<CR>
nnoremap <c-o> :bnext<CR>

" 編集中のバッファへ移動
nnoremap <c-p> :bdelete<CR>
