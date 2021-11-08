local cmp = require("cmp")
local lspkind = require("lspkind")

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Configuration
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
		{ name = "rg" },
		{ name = "spell" },
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
				luasnip = "[Snip]",
				rg = "[RG]",
				spell = "[Spell]",
			},
		}),
	},
})

-- Nvim Autopairs Integration With Cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Friendly Integration With Luasnip
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { vim.env.HOME .. "/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
	include = { "javascript", "typescript", "vim", "lua", "python", "bash", "html", "css", "json" },
})
