" Auto Center nvim
autocmd InsertEnter * norm zz

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Basic Maps
nnoremap q :q<cr>
nnoremap w :w<cr>

" Movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NERDTree
nnoremap nt :NERDTree<cr>
nnoremap nf :NERDTreeFind<cr>

map rcs :so ~/.config/nvim/init.vim<cr> 
map rce :call Vimrc()<cr>
function! Vimrc()
        silent !cd ~/.config/nvim
        silent NERDTree ~/.config/nvim
        echo "Opened your NeoVim Config"
endfunction
