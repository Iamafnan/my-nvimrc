-- Diagnostics Setup
vim.diagnostic.config({
    virtual_text = false,
    float = {
        show_header = true,
        source = 'always',
        focusable = false,
    },
    update_in_insert = true,
})

-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, {
   border = "single"
})
