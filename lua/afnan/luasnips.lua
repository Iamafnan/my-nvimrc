local luasnips = require("luasnip")
-- local types = require("luasnip.util.types")
-- local colors = require("afnan.statusline.colors")
require("luasnip.loaders.from_vscode").load({
	path = { "~/.config/custom-snippets/" },
})
require("luasnip.loaders.from_vscode").load({
	path = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" },
})
require("luasnip.loaders.from_vscode").load({
	path = { "~/.local/share/nvim/site/pack/packer/start/abusaidm.html-snippets-0.0.18/" },
})

luasnips.config.setup({
	history = true,
	updateevents = "InsertLeave",
	-- store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})
