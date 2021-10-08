vim.cmd('autocmd InsertEnter * norm zz')
vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap')

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
