" Autp Center cursor on entering insert mode
autocmd InsertEnter * norm zz

" Set wrap for telescope
autocmd User TelescopePreviewerLoaded setlocal wrap

" Auto install plugin 
autocmd BufWritePost packer.lua source % | PackerInstall

" Auto Insert in terminal buffer
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

autocmd ColorScheme dracula call WhichKeyHigh()
autocmd ColorScheme dracula call DraculaPmenu()

" Diagnostics
autocmd CursorHold,CursorHoldI * :lua vim.diagnostic.open_float(0, {scope = "line"})
