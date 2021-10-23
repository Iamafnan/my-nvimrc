local cmp = require'cmp'
local lspkind = require('lspkind')
-- lspkind.init()
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })},
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'look', keyword_length = 1 },
    { name = 'calc' }
  },
  documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }},
  experimental = { ghost_text = true, native_menu = false },
  formatting = { format = lspkind.cmp_format{ with_text = true, menu = {
        buffer = "[Buf]", nvim_lsp = "[LS]", nvim_lua = "[LUA]", path = "[Path]", calc = "[Calc]", look = "[Look]", vsnip = "[Snip]", luasnip = "[Snip]" }}}})

vim.cmd([[
        hi CmpItemKind ctermfg=green
    hi CmpItemMenu ctermfg=green
]])
