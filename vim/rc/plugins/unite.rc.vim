let g:unite_enable_start_insert = 1   " インサートモードで有効
let g:unite_enable_ignore_case = 1    " 検索で大文字／小文字を区別しない
let g:unite_enable_smart_case = 1       

" grep search word in curent directory recusively
nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" grep search inplace word in current directory recusively
nnoremap <silent> ,ugi :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep search word in search results recusively
nnoremap <silent> ,ugr :<C-u>UniteResume search-buffer<CR>

" file/new
nnoremap <silent> ,un :<C-u>Unite file/new<CR>

" buffer
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

" file
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" register
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register regsiter<CR>

" most recently used
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>

" utility
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>

" all lists
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')

" unite grep call 'ag'
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
