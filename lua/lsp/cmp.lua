local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'look', keyword_length = 2 },
    { name = 'calc' }
  },
  documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }},
  experimental = { ghost_text = true },
  formatting = { format = function(entry , vim_item)
                        vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
                        vim_item.menu = ({
                                nvim_lsp = '[LSP]',
                                look = '[LOOK]',
                                buffer = '[BUFFER]',
                                vsnip = '[VSNIP]',
                                luasnip = '[LUASNIP]',
                                path = '[PATH]',
                                calc = '[CALC]',
                                nvim_lua = '[LUA]'
                        })[entry.source.name]
                        return vim_item
                end
  },
})
vim.cmd('highlight! link CmpItemAbbr Pmenu')
vim.cmd('highlight! link CmpItemKind Pmenu')
vim.cmd('highlight! link CmpItemMenu Pmenu')
