local nvim_lsp = require'lspconfig'
local protocol = require 'vim.lsp.protocol'

local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_options(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        local opts = { noremap = true, silent = true }
        
        buf_set_keymap('n', 'gd' , '<Cmd> lua vim.lsp.buf.definition()<CR>', opts)
        if client.resolved_capabilities.document_formattng then
                vim.api.nvim_command[[augroup Format]]
                vim.api.nvim_command[[autocmd! * <buffer>]]
                vim.api.nvim_command[[autocmd BufferWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync{}]]
                vim.api.nvim_command[[]]
                vim.api.nvim_command[[augroup END]]
        end
        local on_attach = function(client, bufnr)
end
end

nvim_lsp.tsserver.setup{
        on_attach = on_attach,
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },

}

