local sources = {
	{ name = "luasnip", max_item_count = 2 },
	{ name = "nvim_lsp", max_item_count = 4 },
	{ name = "buffer", max_item_count = 2 },
	{ name = "path" },
}

if vim.o.ft == "lua" then
	table.insert(sources, { name = "nvim_lua" })
end

if vim.o.ft == "zsh" then
	table.insert(sources, { name = "zsh" })
	require("cmp_zsh").setup({
		zshrc = true,
		filetypes = { "zsh" },
	})
end

return sources
