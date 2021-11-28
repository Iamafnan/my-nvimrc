local cmp = require("cmp")
local cmd = vim.cmd
local comparator = require("cmp-under-comparator")
local set = vim.opt
local kind_icons = require("lsp.kinds").kind
-- local kind_menu = {
-- 	buffer = "[Buf]",
-- 	nvim_lsp = "[LS]",
-- 	nvim_lua = "[Api]",
-- 	rg = "[RG]",
-- 	path = "[Path]",
-- 	ultisnips = "[Ulti]",
-- 	emmet = "Emmet",
-- }

-- Configuration
cmp.setup({
	completion = { keyword_length = 1 },
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "ultisnips" },
		{ name = "path" },
		{ name = "emmet" },
		{ name = "nvim_lua" },
		{ name = "rg", option = { debug = true } },
	},
	experimental = { ghost_text = true, native_menu = false },
	documentation = { border = solid },
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr:sub(1, 30)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			return vim_item
		end,
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			comparator.under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Nvim Autopairs Integration With Cmp
local autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", autopairs.on_confirm_done())

-- UltiSnips Configuration
vim.g.UltiSnipsSnippetDirectories = { "~/.local/share/nvim/Ultisnips" }
vim.g.UltiSnipsRemoveSelectModeMappings = 0

-- completion menu settings
set.pumheight = 8

-- vim_item.menu = kind_menu[entry.source.name]
