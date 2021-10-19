local capabilities = require('lsp.utils.capabilities')
local on_attach = require('lsp.utils.on_attach')
local flags = require('lsp.utils.flags')
local nvim_lsp = require('lspconfig')

nvim_lsp.html.setup{
        capabilities = capabilities,
        on_attach = on_attach,
        flags = flags
}
