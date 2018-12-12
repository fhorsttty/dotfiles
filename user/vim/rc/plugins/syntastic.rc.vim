" Perl
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ 'perl', 'podchecker' ]

" Python
let g:loaded_syntastic_python_pylint_checker = 0
" pip install flake8
let g:syntastic_python_checkers = [ 'flake8' ]

let g:syntastic_javascript_checkers = [ 'eslint' ]
let g:syntastic_typescript_checkers = [ 'tslint' ]
let g:syntastic_markdown_checkers = [ 'textlint' ]
let g:syntastic_text_checkers = [ 'textlint' ]
let g:syntastic_rst_checkers = [ 'sphinx' ]
