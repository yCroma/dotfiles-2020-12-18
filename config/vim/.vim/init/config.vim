" config.vim
set encoding=utf-8

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=1            " Fix backspace behavior on most terminals.

set number                 " show number of column

au FileType vim setlocal foldmethod=marker " Set Folding comment {{{ }}}

set noswapfile             " Disable swapfile

set splitright             " open tab to right
set hidden                 " move if file isn't seved

" leave japanise at leaving insert
if has('mac')
    let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
    augroup MyIMEGroup
        autocmd!
        autocmd InsertLeave * :call system(g:imeoff)
    augroup END
endif

" copy & paste をクリップボードに対応
set clipboard=unnamed,unnamedplus

" statusline
set laststatus=2
set showcmd

" save position carsol {{{
augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END
" }}}


" stop undofile {{{
set undofile               " External undo
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir " Save external undo into this directory
" }}}
