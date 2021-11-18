" Autp Center cursor on entering insert mode
autocmd InsertEnter * norm zz

" Set wrap for telescope
autocmd User TelescopePreviewerLoaded setlocal wrap

" Auto Format on :w
autocmd BufWritePre * Neoformat

" Auto install plugin 
autocmd BufWritePost packer.lua source % | PackerInstall

" Auto disable tabline in dashboard
autocmd FileType dashboard set showtabline=0
autocmd WinLeave <buffer> set showtabline=2

" Auto Insert in terminal buffer
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
