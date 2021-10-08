local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
        completion = {
                autocomplete = true,
                },
        snippet = {
                expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                        end,      
                        },
                mapping = {
                        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.close(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                        },
                sources = {
                        { name = 'nvim_lsp' },
                        { name = 'buffer' },
                        { name = 'path' },
                        { name = 'luasnip' },
                        { name = 'nvim_lua' }
                        },
                formatting = {
                        format = lspkind.cmp_format({with_text = true, menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                        })}),
                        },
})
