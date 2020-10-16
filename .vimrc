" my vim config

" main .vimrc {{{
syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=2            " Fix backspace behavior on most terminals.

set number                 " show number of column
set cursorline
hi clear CursorLine

au FileType vim setlocal foldmethod=marker " Set Folding comment {{{ }}}

set noswapfile             " Disable swapfile

set hls                    " highlight to be serched
set ignorecase             " not distinct Character case
set smartcase              " if BigCaracter was inputed, Sarch word no distinction
set wrapscan               " reache the bottom, go to top
" push Esc twice, stop hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

set splitright             " open tab to right
set hidden                 " move if file isn't seved

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

" moving into insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-f> <Left>
imap <C-b> <Right>

" move buffer
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
" 直前のバッファを開く
" nnoremap <silent>bb :b#<CR>
nnoremap <silent>bf :bfirst<CR>
nnoremap <silent>bl :blast<CR>
" 編集中のバッファへ移動
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>

" add new line into normal mode with Enter
noremap <CR> $i<Right><CR><ESC>

" add space into normal mode with space
noremap <Space> i<Space><ESC>

" leave japanise at leaving insert
if has('mac')
    let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
    augroup MyIMEGroup
        autocmd!
        autocmd InsertLeave * :call system(g:imeoff)
    augroup END
endif

inoremap <C-c> <Esc>

" Save using Ctrl + s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i<Right>

" autosave
inoremap <Esc> <Esc>:w<CR>

" highlight whitespace at end of line {{{
" set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" highlight NonText    ctermfg=144 guibg=#afaf87
" highlight SpecialKey ctermfg=144 guibg=#afaf87

set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" }}}

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

" auto reload .vimrc {{{
" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
" augroup END
" }}}

" auto load .vimrc {{{
" augroup vimenter-vimrc
"     autocmd!
"     autocmd BufNewFile, BufRead *.css source $MYVIMRC 
"     autocmd VimEnter * source $MYVIMRC

" augroup END

" autocmd BufNewFile,BufRead * source ~/.vimrc
" }}}

" stop undofile {{{
set undofile               " External undo
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir " Save external undo into this directory
" }}}

" }}}

" Dein {{{

if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " plugin install {{{
    call dein#add('reireias/vim-cheatsheet') " cheatsheet
    call dein#add('flazz/vim-colorschemes') " colorscheme
    call dein#add('vim-airline/vim-airline') " status bar
    call dein#add('vim-airline/vim-airline-themes') " status bar theme
    call dein#add('cohama/lexima.vim') " auto close
    " lexima#add_rule {{{
    " /*  */
    call lexima#add_rule({'char': '*', 'at': '/\%#', 'input': '* ', 'input_after': ' */'})
    call lexima#add_rule({'char': '<BS>', 'at': '/* \%#', 'input': '<BS><BS><BS>', 'delete': 3})
    " <!--  -->
    call lexima#add_rule({'char': '!', 'at': '<\%#', 'input': '!-- ', 'input_after': ' -->'})
    call lexima#add_rule({'char': '<BS>', 'at': '<!-- \%#', 'input': '<BS><BS><BS><BS><BS>', 'delete': 4, 'filetype': 'html'})
    " add new line for emmet html
    call lexima#add_rule({'char': '<CR>', 'at': '>\%#<', 'input_after': '<CR>', 'filetype': 'html'})
    " `````` add middle new line
    call lexima#add_rule({'char': '<CR>', 'at': '```\%#', 'input_after': '<CR>'})
    " }}}

    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'}) " coc-lsp for terraform 
    call dein#add('hashivim/vim-terraform') " auto indent for terraform
    call dein#add('mattn/emmet-vim') " emmet
    call dein#add('mattn/webapi-vim') " webapi for emmet
    call dein#add('cocopon/vaffle.vim') " filer
    call dein#add('justinmk/vim-sneak') " jump chars
    call dein#add('ConradIrwin/vim-bracketed-paste') " paste keep indent
    call dein#add('tpope/vim-surround') " change '' to ``
    " call dein#add('nathanaelkane/vim-indent-guides') " indent guides
    call dein#add('Yggdroot/indentLine') " indent guides 2
    call dein#add('airblade/vim-gitgutter') " show different
    call dein#add('tpope/vim-fugitive') " fugitive
    " call dein#add('prabirshrestha/vim-lsp') " needed for mattn's lsp
    " call dein#add('mattn/vim-lsp-settings') " lsp-settings
    " }}}
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" plugin setting {{{
" cheatsheet.md 
let g:cheatsheet#cheat_file = '~/.vim/.cheatsheet.md'

" colorschema
colorscheme Tomorrow-Night-Bright

" airline colorscheme
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
set ttimeoutlen=1

" lexima setting
let g:lexima_enable_newline_rules = 1

" auto indent for terraform
let g:terraform_align=1
" auto format for terraform
let g:terraform_fmt_on_save=1

" snnippets_custom.json for emmet
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/.snippets_custom.json')), "\n"))

" mattn lsp settings
" let g:lsp_settings_servers_dir='~/.local/share/vim-lsp-settings/servers'

" setting for indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" set ts=4 sw=4 et
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

let g:indentLine_char = '│'

" }}}
" }}}

"}}}

