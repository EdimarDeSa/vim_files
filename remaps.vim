
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
