local cmp = require("cmp")
local cmd = vim.cmd
local comparator = require("cmp-under-comparator")
local set = vim.opt
local kind_icons = require("lsp.kinds").kind
local luasnip = require('luasnip')
local loaders = require("luasnip.loaders.from_vscode")

-- Configuration
cmp.setup({
	completion = { keyword_length = 1, autocomplete = false },
	snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body)
      end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-n>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Manual}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
      { name = "luasnip" },
		{ name = "path" },
		{ name = "emmet" },
		{ name = "nvim_lua" },
	},
	experimental = { ghost_text = true, native_menu = false },
	documentation = { border = solid },
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr:sub(1, 30)
			vim_item.kind = kind_icons[vim_item.kind]
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

-- Luasnip Config
loaders.lazy_load({
	paths = { vim.env.HOME .. "/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
	include = { "javascript", "vim", "lua", "python", "bash", "html", "css", "json" },
})
-- completion menu settings
set.pumheight = 8
