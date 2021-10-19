local cmp_nvim_lsp = require('cmp_nvim_lsp')

local nvim_lsp = require('lspconfig')
local nvim_lsp_config = require('lspconfig/configs')
local signature = require('lsp_signature')

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
-- nvim_lsp.html.setup{
--         on_attach = on_attach,
--         capabilities = capabilities,
--         flags = flags
-- }

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
