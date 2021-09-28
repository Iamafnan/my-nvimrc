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

" Completion.Nvim
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr> <S-tab> pumvisible() ? "\<C-p>" : "\<S-tab>"
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" For Nvim Costomization
map rcs :so ~/.config/nvim/init.vim<cr> 
