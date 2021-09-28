  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
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
      { name = 'vsnip' },
      { name = 'buffer' },
    },
  formatting = {
    format = function(entry, vim_item)
            local icons = { 
Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Event = "",
  -- Field = " ",
  Field = "ﰠ",
  -- File = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = "",
  Snippet = "﬌ ",
  Struct = " ",
  -- Text = " ",
  Text = "",
  TypeParameter = "",
  -- Unit = " ",
  Unit = "塞",
  Value = " ",
  -- Variable = " ",
  Variable = "",
            }
      vim_item.kind = icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "[L]",
        emoji = "[E]",
        path = "[F]",
        calc = "[C]",
        buffer = "[B]",
        ultisnips = "[U]",
        -- add nvim_lua as well
      })[entry.source.name]
      vim_item.dup = ({
        buffer = 1,
        path = 1,
        nvim_lsp = 1,
      })[entry.source.name] or 0
      return vim_item
    end,
  },
  })
