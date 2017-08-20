let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
nmap <silent> ,vs :<C-u>VimShell<CR>
nmap <silent> ,vsc :<C-u>VimShellCreate<CR>
nmap <silent> ,vsp :<C-u>VimShellPop<CR>
