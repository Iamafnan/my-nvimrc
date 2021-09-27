" Auto Center nvim
autocmd InsertEnter * norm zz

" Basic Maps
nnoremap q :q<cr>
nnoremap w :w<cr>
map i a
map k gk
map j gj

" Splits Movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Vim-Commentry
nnoremap cm :Commentary<cr>

" NERDTree
" nnoremap nt :NERDTree<cr>
" nnoremap nf :NERDTreeFind

" Nvim-Tree
nnoremap nt :NvimTreeOpen<cr>
nnoremap nf :NvimTreeFindFile<cr>

" For Nvim Costomization
map rcs :so ~/.config/nvim/init.vim<cr> 

" For Fugitive
nnoremap gp :Git add .<cr> | :Git commit -m "See Diff"<cr> | :Git push origin main<cr>
