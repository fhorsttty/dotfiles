let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
let g:vimshell_vimshrc_path = $HOME . '/.vim/rc/vimshrc'
nmap <silent> ,vs :<C-u>VimShell<CR>
nmap <silent> ,vsc :<C-u>VimShellCreate<CR>
nmap <silent> ,vsp :<C-u>VimShellPop<CR>
