
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-jedi',
      \'coc-rls',
      \'coc-tsserver',
      \'coc-css',
      \'coc-yaml',
      \'coc-html',
      \'coc-highlight',
      \'coc-markdownlint',
      \'coc-snippets',
      \]

" Configurações sugeridas pelo coc
autocmd FileType css	setl iskeyword+=-

autocmd FileType scss	setl iskeyword+=@-@

autocmd CursorHold * silent call CocActionAsync('highlight')

au FileType yaml if bufname("%") =~# "docker-compose.yml" |	set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" |	set ft=yaml.docker-compose | endif

let g:coc_filetype_map = { 'yaml.docker-compose': 'dockercompose', }
let g:LanguageClient_serverCommands = { 'sql': ['sql-language-server', 'up', '--method', 'stdio'], }

" Use <c-space> to trigger completion.
inoremap <silent><expr><c-space> coc#refresh()

" Use TAB for select next completion or do TAB
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Use SHIFT+TAB for select forward completion or go back
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:airline#extensions#coc#enabled = 1

