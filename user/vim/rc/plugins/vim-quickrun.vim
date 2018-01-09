let g:quickrun_config = get(g:, 'quickrun_config', {})

" 成功 => bufferに出力する。
" 失敗 => quickfixに出力する。
let g:quickrun_config = {
      \ '_' : {
      \   'runnter'    : 'vimproc',
      \   'runner/vimproc/updatetime' : 60,
      \   'outputter'  : 'error',
      \   'outputter/error/success' : 'buffer',
      \   'outputter/error/error/'  : 'quickfix',
      \   'outputter/buffer/split'  : ':rightbelow 8sp',
      \   'outputter/buffer/close_on_empty' : 1 },
      \ }

" \r => quickfixを閉じて保存してから、quickrunを実行する。
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
