set nocp
set exrc
filetype off

call plug#begin('~/.vim/plugged')

" Linters and fixers
Plug 'dense-analysis/ale' " Linter
"Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'vim-scripts/indentpython.vim' " Python indent
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'rust-lang/rust.vim' " Rust support

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
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Theme
Plug 'doums/darcula'
Plug 'ryanoasis/vim-devicons' " Icons


Plug 'github/copilot.vim' " Copilot

call plug#end()

" -------------------------------------------------------------------------------------------------
" UI settings
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=2        " Show existing tab with 2 spaces width
set softtabstop=2    " Show existing tab with 2 spaces width
set shiftwidth=2     " When indenting with '>', use 2 spaces width
set expandtab        " On pressing tab, insert 2 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set hlsearch         " Highlight search results
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=2      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set cmdheight=2      " Give more space for displaying messages
set updatetime=60   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set showmatch        " Show matching brackets
set matchtime=2      " How many tenths of a second to blink
set list             " Show listchars
set nowritebackup    " No backup files
set splitright         " Create the vertical splits to the right
set splitbelow         " Create the horizontal splits below
set autoread           " Update vim after file update from outside
set mouse=a            " Enable mouse support
set wildmenu           " Turn on WiLd menu
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set formatoptions=crql " Automatic formatting options
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
set completeopt-=preview "Disables preview
set clipboard=unnamed
set inccommand=split   " Show the effects of a command incrementally
set showtabline=2      " Always show the tabline
set laststatus=2       " Always show the status line
set linespace=4        " Adds some line space for easy reading
set foldmethod=indent  " Fold based on indent
set foldlevel=99       " Open all folds
set foldenable         " Enable folding
set foldcolumn=0       " Show fold column
set mousehide          " Hid mouse after chars typed
set showmode           " Show mode
set backspace=2        " Delete everything with backspace
set cindent            " C style indenting
set autoindent         " Copy indent from current line
set guifont=CousineNerdFont-Regular:h14 " Set the font
set cursorline
set relativenumber
set inccommand=split

filetype on          " Detect and	set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

" -------------------------------------------------------------------------------------------------
" Sounds
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter *	set vb t_vb=

" -------------------------------------------------------------------------------------------------
" Ignored files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/vendor/ruby/*,*/.bundle/*,*/.sass-cache/*,*/.bin/*
set wildignore+=*/doc/*,*/.yardoc/*
set wildignore+=*/.idea/*
set wildignore+=*/node_modules/*
set wildignore+=*/.vscode/*

" -------------------------------------------------------------------------------------------------
" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw
" Reset the listchars
set listchars=""
" a tab should display as "  ", trailing whitespace as "."
set listchars=tab:\ \  " Indentended trailing whitespace
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" -------------------------------------------------------------------------------------------------
" Theme configuration
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
endif

colorscheme darcula

" -------------------------------------------------------------------------------------------------
" NERDTree configuration
nmap <C-a> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
      \ | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%')
      \!~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# |
      \execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeFileLines = 1
let NERDTreeShowHidden=1






" -------------------------------------------------------------------------------------------------
"  Airline configuration
let g:airline_detect_modified = 1
let g:airline_detect_spell = 1
let g:airline_detect_spelllang = 1
let g:airline_theme='google_dark'
let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
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
let g:airline_powerline_fonts = 1

" -------------------------------------------------------------------------------------------------
" CtrlP
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = '\v[\/](vendor\/ruby|node_modules|.log|.git|.hg|.svn|.lock|venv)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" -------------------------------------------------------------------------------------------------
" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['black', 'isort'],
      \}
let g:ale_linters = {
      \   'python': ['flake8', 'pyright', 'bandit'],
      \}

let g:ale_fix_on_save = 1

let g:ale_use_neovim_diagnostics_api = 1
let g:ale_lint_on_text_changed = 'never' " Lint only when saving
let g:ale_lint_on_insert_leave = 0 " Lint only when saving
let g:ale_lint_on_enter = 0 " Lint only when saving

" Python ALE options
let g:ale_python_flake8_options =
      \'--max-line-length=80 --extend-ignore=E203 --python=$(poetry env info -p)/bin/python'
let g:ale_python_black_options = '--line-length 80'
let g:ale_python_isort_options = '--profile black -l 80'

" -------------------------------------------------------------------------------------------------
"  Syntastic configuration
"let g:syntastic_python_checkers = ['flake8', 'pyright', 'bandit']
"let g:syntastic_aggregate_errors = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

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
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:LanguageClient_serverCommands = { 'sql': ['sql-language-server', 'up', '--method', 'stdio'], }

" -------------------------------------------------------------------------------------------------
"  SimpylFold
let g:simpylfold_docstring_preview = 1
let g:simpylfold_fold_python_files = 1

" -------------------------------------------------------------------------------------------------
" Rust
autocmd FileType rust silent! nnoremap <silent> <Leader>f :RustFmt<CR>

" ____________________________________________
" Python
au BufNewFile, BufRead *.py
      \	set tabstop=4
      \	set softtabstop=4
      \	set shiftwidth=4
      \	set textwidth=79
      \	set fileformat=unix
let python_highlight_all=1

au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace/\s\+$/

" -------------------------------------------------------------------------------------------------
" Remaps

let mapleader = "\<Space>"
noremap <leader>sv :source %<CR>

nnoremap op o<Esc>k

nnoremap oi O<Esc>j
nnoremap oo A<CR>

" Cria tab
nnoremap te :tabe<CR>

" navegação no buffer
nnoremap ty :bn<CR>
nnoremap tr :bp<CR>

" Deleta buffer
nnoremap td :bd<CR>

" Criação de splits
nnoremap th :split<CR>
nnoremap tv :vsplit<CR>

" Deleta split
nnoremap tt :q<CR>

" Call command
nnoremap tc :!

" Realiza o folding
nnoremap <space> za

" Ctrl padrão para saidas
map <C-c> "+y
map <C-v> "+p
map <C-d> yyp
vmap <C-d> yp
nnoremap <C-A-r> :%s/
" Key mappings for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Abre o terminal
map <s-t> :split \| terminal<CR>
map <C-s> :w<CR>


" -------------------------------------------------------------------------------------------------
" Hilight de palavra em cursor
function! HighlightWordUnderCursor()
  if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
    exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
  else
    call clearmatches()
  endif
endfunction
autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
