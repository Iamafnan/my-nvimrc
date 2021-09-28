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
        require 'completion'.on_attach(client, bufnr)
        local on_attach = function(client, bufnr)
        protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end
end

nvim_lsp.tsserver.setup{
        on_attach = on_attach,
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },

}

