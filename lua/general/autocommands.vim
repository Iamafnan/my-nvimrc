autocmd InsertEnter * norm zz
autocmd User TelescopePreviewerLoaded setlocal wrap
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
autocmd BufWritePre *.js,.html,.css,.python Neoformat
