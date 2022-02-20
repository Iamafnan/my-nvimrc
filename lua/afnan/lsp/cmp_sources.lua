local sources = {
	{ name = "luasnip" },
	{ name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "path" },
}
local context = require("cmp.config.context")

if vim.o.ft == "lua" then
	table.insert(sources, { name = "nvim_lua" })
end

if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
	sources = {
		{ name = "buffer", max_item_count = 3 },
	}
end

return sources
