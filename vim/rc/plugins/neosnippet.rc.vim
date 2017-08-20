imap <C-k>  <Plug><neosnippet_expand_or_jump>
smap <C-k>  <Plug><neosnippet_expand_or_jump>
xmap <C-k>  <Plug><neosnippet_expand_target>

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \ :pumvisible() ? "\<C-n>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibity = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1

let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'
