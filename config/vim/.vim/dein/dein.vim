" dein.vim

if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:toml_dir = expand('~/.vim/dein/toml')

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Required
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Load TOML
    let s:color = s:toml_dir . '/color.toml'
    let s:git = s:toml_dir . '/git.toml'
    let s:tool = s:toml_dir . '/tool.toml'
    let s:tool_lazy = s:toml_dir . '/tool_lazy.toml'
    let s:tool_lazy3 = s:toml_dir . '/tool_lazy3.toml'
    let s:lexima = s:toml_dir . '/lexima.toml'

    " read toml and cache
    call dein#load_toml(s:color, {'lazy': 0})
    call dein#load_toml(s:git, {'lazy': 1})
    call dein#load_toml(s:tool, {'lazy': 1})
    call dein#load_toml(s:tool_lazy, {'lazy': 2})
    call dein#load_toml(s:tool_lazy3, {'lazy': 3})
    call dein#load_toml(s:lexima, {'lazy': 4})

    " end state
    call dein#end()
    call dein#save_state()
endif

"remove
call map(dein#check_clean(), "delete(v:val, 'rf')")

filetype plugin indent on
syntax enable
syntax on

" }}}

