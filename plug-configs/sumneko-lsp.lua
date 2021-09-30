require('lspconfig').sumneko_lua.setup{
        cmd = {"$HOME/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server","-E","$HOME/.local/share/nvim/lspinstall/lua/main.lua",},
        settings = {
                Lua = {
                        diagnostics = {
                                globals = { "vim",},
                        },
                        workspace = {
                                library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                                        },
                                maxPreload = 100000,
                                preloadFileSize = 10000
                                },
                        },
                },
        }
