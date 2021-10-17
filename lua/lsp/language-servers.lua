local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown'}
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 }}
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" }}

local nvim_lsp = require('lspconfig')
local nvim_lsp_config = require('lspconfig/configs')
local signature = require('lsp_signature')

local opts = { noremap = true , silent = true }

local on_attach = function( client , bufnr )
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sp', ':Lspsaga preview_definition<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr , 'n', 'sd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        signature.on_attach()
end

local flags =  { debounce_text_changes = 150 }

-- TypeScript / Javascript
nvim_lsp.tsserver.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}
nvim_lsp.rome.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- HTML
nvim_lsp.html.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- CSS
nvim_lsp.cssls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
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
        capabilities = capabilities,
        flags = flags
}

-- Vim
nvim_lsp.vimls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- Bash / Zsh
nvim_lsp.bashls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- Python
nvim_lsp.pyright.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- JSON
nvim_lsp.jsonls.setup{
commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        },
    },
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}

-- Linting
nvim_lsp.stylelint_lsp.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = flags
}
