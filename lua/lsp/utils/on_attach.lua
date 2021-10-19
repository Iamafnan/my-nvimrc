local signature = require('lsp_signature')
local opts = { noremap = true , silent = true }

local on_attach = function( client , bufnr )

signature.on_attach()

vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sp', ':Lspsaga preview_definition<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
end


