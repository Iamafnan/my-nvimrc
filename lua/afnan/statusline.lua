local theme = vim.g.colors_name

require("lualine").setup({
	options = {
		theme = theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_x = { "filetype" },
	},
	extentions = { "NvimTree" },
})
