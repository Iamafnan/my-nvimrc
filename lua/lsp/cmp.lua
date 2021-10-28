local cmp = require("cmp")
local lspkind = require("lspkind")
lspkind.init()
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
	},
	documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
	experimental = { ghost_text = true, native_menu = false },
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LS]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				luasnip = "[Snip]",
			},
		}),
	},
})
