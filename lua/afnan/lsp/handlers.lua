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

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })

vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })

vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Autoshow diagnostics
vim.api.nvim_exec([[
  augroup ShowDiagnosticFloat
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(0, {focusable = false, scope = 'line', source = 'always'})
  augroup end
]], false )
-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, {
   border = "single"
})

-- References
vim.lsp.handlers["textDocument/references"] = require 'nice-reference'.reference_handler
