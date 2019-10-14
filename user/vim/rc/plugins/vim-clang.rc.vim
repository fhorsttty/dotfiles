" disable auto completion for vim-clang
let g:clang_auto = 0

" default 'longest' cannot work with neocomplete
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'

let g:clang_exec = 'clang'
let g:clang_format_exec = 'clang-format'

let g:clang_format_auto = 1
let g:clang_check_syntax_auto = 1
" 'LLVM' | 'Google' | 'Chromium' | 'Mozilla' | 'WebKit'
let g:clang_format_style = 'Google'

let g:clang_c_options = '
  \ -std=gnu11
  \ -I/usr/include/x86_64-linux-gnu/
  \ '
let g:clang_cpp_options = '
  \ -std=c++1z
  \ -stdlib=libc++
  \ -pedantic-errors
  \ -I/usr/include/x86_64-linux-gnu/
  \ '
