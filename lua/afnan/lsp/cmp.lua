---@diagnostic disable: unused-local
local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local context = require("cmp.config.context")

-- local function is_in_comment()
-- 	if vim.api.nvim_get_mode().mode == "c" then
-- 		return true
-- 	else
-- 		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
-- 	end
-- end

local border = { "", "", "", " ", "", "", "", " " }

local luasnip = prequire("luasnip")
local cmp = prequire("cmp")
local kind_icons = require("afnan.lsp.kinds")
local sources = require("afnan.lsp.cmp_sources")

-- Configuration
cmp.setup({
	-- enabled = is_in_comment,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.close(),
		-- ["<C-a>"] = cmp.mapping.toggle_doc(),
		["<C-a>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = sources,
	experimental = { ghost_text = true },
	view = { entries = "custom" },
	documentation = {
		border = border,
		optional_doc = true,
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr:sub(1, 30)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.dup = { buffer = 0, path = 0, nvim_lsp = 0, nvim_lua = 0 }
			return vim_item
		end,
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- completion menu settings
vim.opt.pumheight = 8
vim.o.pumblend = 20
