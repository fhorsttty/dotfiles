let g:neocomplete#enable_at_startup = 1

" <TAB> completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
" No preview window for C and C++
let g:neocomplete#force_omni_input_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
