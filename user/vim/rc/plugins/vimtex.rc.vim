let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_view_general_options = '@pdf'
let g:vimtex_latexmk_options = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \     '-pdfdvi',
      \     '-verbose',
      \     '-file-line-error',
      \     '-synctex=1',
      \     '-interaction=nonstopmode',
      \ ]}
