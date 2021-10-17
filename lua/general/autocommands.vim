autocmd InsertEnter * norm zz
autocmd User TelescopePreviewerLoaded setlocal wrap
" autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
" autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
" autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.definition()
" autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

" autocmd ColorScheme * require("staline").set_statusline()
