local cmp = require("cmp")
local lspkind = require("lspkind")

-- Configuration
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
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
		{ name = "buffer" },
		{ name = "ultisnips" },
		{ name = "path" },
		{ name = "nvim_lua" },
	},
	experimental = { ghost_text = true, native_menu = false },
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LS]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				ultisnips = "[Ulti]",
			},
		}),
	},
})

-- Nvim Autopairs Integration With Cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- UltiSnips Configuration
vim.g.UltiSnipsSnippetDirectories = { "~/.local/share/nvim/Ultisnips" }
