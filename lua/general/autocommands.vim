autocmd InsertEnter * norm zz
autocmd User TelescopePreviewerLoaded setlocal wrap
autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
