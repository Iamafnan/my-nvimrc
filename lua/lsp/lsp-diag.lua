local nvim_lsp_diag = require('vimway-lsp-diag')

nvim_lsp_diag.init({
        debounce_ms = 50,
        buf_clients_only = true,
})
