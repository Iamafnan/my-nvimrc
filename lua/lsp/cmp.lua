local cmp = require("cmp")
local set = vim.opt
local kind_icons = require("lsp.kinds").icons

-- Configuration
cmp.setup({
	completion = { keyword_length = 1 },
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
		{ name = "emmet" },
		{ name = "nvim_lua" },
		{ name = "rg" },
	},
	experimental = { ghost_text = true, native_menu = false },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr:sub(1, 30)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[Buf]",
				nvim_lsp = "[LS]",
				nvim_lua = "[Api]",
				path = "[Path]",
				ultisnips = "[Ulti]",
				emmet = "Emmet",
				rg = "[RG]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Nvim Autopairs Integration With Cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- UltiSnips Configuration
vim.g.UltiSnipsSnippetDirectories = { "~/.local/share/nvim/Ultisnips" }

-- completion menu settings
set.pumheight = 8
