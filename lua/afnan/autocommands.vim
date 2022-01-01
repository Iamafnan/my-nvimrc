" Autp Center cursor on entering insert mode
autocmd InsertEnter * norm zz

" Set wrap for telescope
autocmd User TelescopePreviewerLoaded setlocal wrap

" Auto install plugin 
autocmd BufWritePost packer.lua source % | PackerInstall

" Auto Insert in terminal buffer
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Automatically show a bulb when code action is available
autocmd CursorHold,CursorHoldI * :lua require('nvim-lightbulb').update_lightbulb({ float = { enabled = true } })
