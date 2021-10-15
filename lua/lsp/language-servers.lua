local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local nvim_lsp_config = require('lspconfig/configs')
local signature = require('lsp_signature')

local opts = { noremap = true , silent = true }

local on_attach = function( client , bufnr )
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sp', ':Lspsaga preview_definition<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sd', '<cmd>lua vim.lsp.buf.decladeclaration()<CR>', opts)
        signature.on_attach()
end

-- TypeScript / Javascript
nvim_lsp.tsserver.setup{
        on_attach = on_attach,
        capabilities = capabilities
}
nvim_lsp.rome.setup{
        on_attach = on_attach,
        capabilities = capabilities,
}

-- HTML
nvim_lsp.html.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- CSS
nvim_lsp.cssls.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- HTML / CSS
  nvim_lsp_config.emmet_ls = {    
    default_config = {    
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css'};
      root_dir = function(fname)    
        return vim.loop.cwd()
      end;    
      settings = {};    
    };    
  }    
nvim_lsp.emmet_ls.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- Vim
nvim_lsp.vimls.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- Bash / Zsh
nvim_lsp.bashls.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- Python 
nvim_lsp.pyright.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- JSON
nvim_lsp.jsonls.setup{
        on_attach = on_attach,
        capabilities = capabilities
}

-- Linting
nvim_lsp.stylelint_lsp.setup{
        on_attach = on_attach,
        capabilities = capabilities
}
