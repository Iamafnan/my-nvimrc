local luasnips = require("luasnip")
-- local types = require("luasnip.util.types")
-- local colors = require("afnan.statusline.colors")
require("luasnip.loaders.from_vscode").load({
	path = { "~/.config/custom-snippets/" },
})

luasnips.config.setup({
	history = true,
	updateevents = "InsertLeave",
	-- store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})
