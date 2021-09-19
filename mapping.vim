" Auto Center nvim
autocmd InsertEnter * norm zz

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Basic Maps
nnoremap q :q<cr>

" Movement
map <C-h> <C-w>h

" NERDTree
nnoremap nt :NERDTree<cr>
nnoremap nf :NERDTreeFind<cr>

" Float Term
nnoremap tt :FloatTermToggle<cr>
nnoremap th :FloatTermHide<cr>


