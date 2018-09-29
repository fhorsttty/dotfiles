let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_exec = 'clang'
let g:clang_format_exec = 'clang-format'
let g:clang_format_auto = 1
let g:clang_check_syntax_auto = 1

" 'LLVM' | 'Google' | 'Chromium' | 'Mozilla' | 'WebKit'
let g:clang_format_style = 'Google'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '
  \ -std=c++1z
  \ -stdlib=libc++
  \ -pedantic-errors
  \ '
