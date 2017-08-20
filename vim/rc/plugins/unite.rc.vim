let g:unite_enable_start_insert = 1   " インサートモードで有効
let g:unite_enable_ignore_case = 1    " 検索で大文字／小文字を区別しない
let g:unite_enable_smart_case = 1       

" grep
nnoremap <silent> ,ug :<C-u>Unite grep:-buffer-name=search-buffer<CR>

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

" all
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
