" Autp Center cursor on entering insert mode
autocmd InsertEnter * norm zz

" Set wrap for telescope
autocmd User TelescopePreviewerLoaded setlocal wrap

" Auto install plugin 
autocmd BufWritePost packer.lua source % | PackerInstall

" Auto Insert in terminal buffer
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" NERDTree Autocommands
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

autocmd ColorScheme dracula call WhichKeyHigh()
autocmd ColorScheme dracula call DraculaPmenu()

" Cmp Ultisnips Setup
autocmd BufWritePost *.snippets :CmpUltisnipsReloadSnippets
