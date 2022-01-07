require("staline").setup({
	sections = {
		left = {
			"- ",
			"-mode",
			"left_sep_double",
			"file_name",
			"  ",
			"branch",
		},
		mid = { "lsp" },
		right = { "right_sep_double", "-line_column" },
	},
	defaults = {
		bg = "none",
		full_path = false,
		branch_symbol = " ",
		line_column = "%l/%L :%c %p%% ",
	},
	mode_colors = {
		n = "#7aa2f7",
		i = "#e86671",
		ic = "#e86671",
		c = "#e27d60",
	},
})
