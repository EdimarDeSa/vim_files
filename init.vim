set nocompatible
set exrc
filetype off

call plug#begin('~/.vim/plugged')

" Linters and fixers
Plug 'dense-analysis/ale' " Linter
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'vim-scripts/indentpython.vim' " Python indent
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'rust-lang/rust.vim' " Rust support
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround' " Surround

" Navigation and search
Plug 'preservim/nerdtree' " File explorer tree
Plug 'Xuyuanp/nerdtree-git-plugin' " Git support for NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NERDTree syntax highlight
Plug 'tpope/vim-fugitive' " Git support
Plug 'kien/ctrlp.vim' " Fuzzy file finder
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes and UI
Plug 'mhinz/vim-startify' " Vim greeting screen
Plug 'doums/darcula' " Theme
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'luochen1990/rainbow' " Rainbow parentheses

" Snippets and autocomplete

Plug 'github/copilot.vim' " Copilot

call plug#end()

" -------------------------------------------------------------------------------------------------
"  General configuration
source ~/.config/nvim/base_settings.vim

if has('gui_running')
  set ts=2 sw=2 et
  set guioptions=egmrt
endif

" Always show the signcolumn, so our buffers doesn't shift on errors
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no


" -------------------------------------------------------------------------------------------------
" Theme configuration

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
  set termguicolors
endif

colorscheme darcula

" -------------------------------------------------------------------------------------------------
" NERDTree configuration
nmap <C-a> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTreeToggle' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
      \ | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%')
      \!~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# |
      \execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeFileLines = 1

" -------------------------------------------------------------------------------------------------
"  Airline configuration
let g:airline_theme='google_dark'
let g:airline_powerline_fonts = 1

let g:airline_detect_modified = 1
let g:airline_detect_spell = 1
let g:airline_detect_spelllang = 1

let g:airline_filetype_overrides = {
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'help':  [ 'Help', '%f' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ }

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#show_line_numbers = 1

" -------------------------------------------------------------------------------------------------
" CtrlP
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = '\v[\/](vendor\/ruby|node_modules|.log|.git|.hg|.svn|.lock|venv)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" -------------------------------------------------------------------------------------------------
"g Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements'],
      \'python': ['black', 'isort', 'autoimport'],
      \'rust': ['rustfmt'],
      \}

let g:ale_linters = {
      \'python': ['flake8', 'bandit', 'pyright'],
      \'rust': ['rust-analyzer'],
      \}

let g:ale_linters_ignore = {
      \   'python': ['ruff'],
      \}

let g:ale_fix_on_save = 1

let g:ale_use_neovim_diagnostics_api = 1
let g:ale_lint_on_text_changed = 'never' " Lint only when saving
let g:ale_lint_on_insert_leave = 0 " Lint only when saving
let g:ale_lint_on_enter = 0 " Lint only when saving
let g:ale_python_auto_poetry = 1
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
let g:ale_set_signs = 1

imap <C-Space> <Plug>(ale_complete)
nnoremap <silent> <Plug>(<CR>) :ALEFindReferences -relative<Return>

" Python ALE options
let g:ale_python_flake8_options =
      \'--max-line-length=80 --extend-ignore=E203 --python=$(poetry env info -p)/bin/python'
let g:ale_python_black_options = '--line-length 80'
let g:ale_python_isort_options = '--profile black -l 80'

" -------------------------------------------------------------------------------------------------
" Rainbow
let g:rainbow_active = 1

" -------------------------------------------------------------------------------------------------
" Coc
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

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" -------------------------------------------------------------------------------------------------
"  SimpylFold
let g:simpylfold_docstring_preview = 1
let g:simpylfold_fold_python_files = 1

" -------------------------------------------------------------------------------------------------
" Rust
autocmd FileType rust silent! nnoremap <silent> <Leader>f :RustFmt<CR>

" -------------------------------------------------------------------------------------------------
" Python
au BufNewFile, BufRead *.py
      \	set tabstop=4
      \	set softtabstop=4
      \	set shiftwidth=4
      \	set textwidth=79
      \	set fileformat=unix
let python_highlight_all=1
let g:python3_host_prog = '/usr/bin/python3'

au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace/\s\+$/

" -------------------------------------------------------------------------------------------------
"  Copilot
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" -------------------------------------------------------------------------------------------------
" Remaps

let mapleader = "\<Space>"
noremap <leader>sv :source %<CR>
noremap <leader>cs :nohls<CR>
noremap <leader>q :q<CR>
nnoremap <leader><CR> o<Esc>a
nnoremap <leader><s-CR> O<Esc>a

" Cria tab
nnoremap te :tabe<CR>

" Deleta buffer
nnoremap td :bd<CR>

" Criação de splits
nnoremap th :split<CR>
nnoremap tv :vsplit<CR>

" Deleta split
nnoremap tt :q<CR>

" Realiza o folding
nnoremap <Space>- zc<CR>
nnoremap <Space>= zo<CR>

" Ctrl padrão para saidas
map <C-c> "+y
map <C-v> "+p
map <C-d> yyp
vmap <C-d> yp
map <C-x> dd

" Atalhos de busca e substituição
noremap <leader>f \<ESC>/
noremap <leader>r :s/\<<C-r><C-w>\>//<left>
noremap <leader><s-r> :%s/\<<C-r><C-w>\>//g<left><left>

" Key mappings for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Abre o termina
nmap <Space>t :vsplit \| terminal<CR>
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" Git shortcuts
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gc :Git commit -m""<left>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gr :Git restore<CR>

" -------------------------------------------------------------------------------------------------
" Hilight de palavra em cursor

function! HighlightWordUnderCursor()
  if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
    exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
  else
    call clearmatches()
  endif
endfunction

" Mapeamento de teclas para chamar a função
autocmd CursorHold * call HighlightWordUnderCursor()
