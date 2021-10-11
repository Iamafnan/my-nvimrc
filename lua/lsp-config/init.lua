local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local lsp_signature = require('lsp_signature')
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
local filetypes = { 'typescript', 'typescriptreact' , 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx', 'vim', 'python' , 'lua', 'html', 'css', 'sh'}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  lsp_signature.on_attach()

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end

nvim_lsp.tsserver.setup{
        on_attach = on_attach,
        filetype = { 'typescript', 'javascript', 'javascript.jsx', 'typescript.tsx', 'typescriptreact', 'javascriptreact' },
        capabilities = capabilities,
        init_options = {
                hostInfo = "neovim",
    },
}

nvim_lsp.vimls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'vim-language-server', '--stdio' },
        filetype = { 'vim' },
        init_options = {
                diagnostic = {
                        enable = true,
                },
                indexes = {
                  count = 3,
                  gap = 100,
                  projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                  runtimepath = true
                },
        },
}

-- nvim_lsp.ymlls.setup{
                -- on_attach = on_attach,
                -- capabilities = capabilities,
                -- cmd = { "yaml-language-server", "--stdio" },
                -- filetypes = { "yaml" },
                -- root_dir = root_pattern(".git"),
-- }

nvim_lsp.tailwindcss.setup{
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
      },
    },
    on_new_config = function(new_config)
          if not new_config.settings then
            new_config.settings = {}
          end
          if not new_config.settings.editor then
            new_config.settings.editor = {}
          end
          if not new_config.settings.editor.tabSize then
            new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
          end
        end,
    settings = {
      tailwindCSS = {
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
        validate = true,
      },
    },
}

nvim_lsp.sumneko_lua.setup{
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        settings = {
                Lua = {
                        telemetry = {
                        enable = false,
        },
      },
    },
        on_attach = on_attach,
        capabilities = capabilities,
}

nvim_lsp.stylelint_lsp.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "stylelint-lsp", "--stdio" },
    filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        settings = {
                stylelintplus = {
                        autoFixOnFormat = true,
                        autoFixOnSave = true,
                        cssInJs = true,
                        enable = true,
                        validateOnType = true,
                },
        },
}

nvim_lsp.rome.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "rome", "lsp" },
    filetypes = { "javascript", "javascriptreact", "json", "typescript", "typescript.tsx", "typescriptreact" },
}

nvim_lsp.diagnosticls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "diagnostic-languageserver", "--stdio" },
        filetypes = filetypes,
}

nvim_lsp.cssls.setup{
        cmd = { "vscode-css-language-server" },
        settings = {
              css = {
                validate = true },
              less = {
                validate = true },
              scss = {
                validate = true }
    },
        on_attach = on_attach,
        capabilities = capabilities
}

nvim_lsp.bashls.setup{
        cmd = { 'bash-language-server', 'start' },
        on_attach = on_attach,
        capabilities = capabilities,
        filetype = { 'sh' }
}

nvim_lsp.html.setup{
        on_attach = on_attach,
        capabilities = capabilities,
cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
    },
}

nvim_lsp.jsonls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json" },
    init_options = {
      provideFormatter = true
    }
}

require'lspconfig'.pyright.setup{
        on_attach = on_attach,
        capabilities = capabilities,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
}

