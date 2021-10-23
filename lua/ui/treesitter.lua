-- TreeSitter configs
local treesitter = require('nvim-treesitter.configs')
treesitter.setup{
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true , keymaps = {
                init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm" }},
        autopairs = { enable = true },
        ensure_installed = { 'json','html','css','javascript','typescript','lua','vim','python', 'bash' }
}

-- Autotag Config
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { underline = true, virtual_text = { spacing = 5, severity_limit = 'Warning' }, update_in_insert = true } )
