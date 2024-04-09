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
set encoding=UTF-8   " The encoding should be utf-8 to activate the font icons
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
set cursorline
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

augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END
