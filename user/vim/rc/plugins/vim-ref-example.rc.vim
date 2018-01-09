let g:ref_perldoc_cmd = 'carton exec perldoc'

" This is sample code.
" Pleae read the website terms of use and use it on your own risk.
" let g:ref_source_webdict_sites = {
"      \   'search': {
"      \     'url': 'https://search.example.co.jp/%s',
"      \     'keyword_encoding': 'utf-8',
"      \     'cache': 1,
"      \   },
"      \ }
" function! g:ref_source_webdict_sites.search.filter(output)
"   return join(split(a:output, "\n")[18 :], "\n")
" endfunction
" nmap <silent>,search :<C-u>Ref webdict search

nmap <silent>,pd :<C-u>Ref perldoc
