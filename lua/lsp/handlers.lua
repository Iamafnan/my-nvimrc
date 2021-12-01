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
