if !exists('g:lspconfig')
        finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client , bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr , ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr , ...) end
        
-- Mappings
local opts = { noremap = true , client = true }

buf_set_keymap( 'n', 'gd', '<Cmd>lua vim.lsp.buf.defination()<CR>', opts)
end

nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
        }
EOF
