local gps = require("nvim-gps")

require("lualine").setup({
	options = {
		theme = "onedark",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = { { gps.get_location, cond = gps.is_available } },
		lualine_x = { "filetype" },
	},
})
