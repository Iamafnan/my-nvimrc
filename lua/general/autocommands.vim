" Autp Center cursor on entering insert mode
autocmd InsertEnter * norm zz

" Set wrap for telescope
autocmd User TelescopePreviewerLoaded setlocal wrap

" Auto Format on :w
autocmd BufWritePre * Neoformat
