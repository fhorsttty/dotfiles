if &compatible
  set nocompatible               " Be iMproved
endif

let s:vim_rc_dir = fnamemodify(expand('<sfile>'), ':h')
let s:dein_repo_dir = s:vim_rc_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:vim_rc_dir)
  call dein#begin(s:vim_rc_dir)

  let s:toml = s:vim_rc_dir . '/dein.toml'
  let s:toml_lazy = s:vim_rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
