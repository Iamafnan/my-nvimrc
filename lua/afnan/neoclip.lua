local neoclip = require("neoclip")

neoclip.setup({
	history = 100,
	enable_persistant_history = true,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = nil,
	preview = true,
	default_register = '"',
	content_spec_column = false,
	on_paste = { set_reg = false },
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "p",
				paste_behind = "b",
				custom = {},
			},
		},
	},
})
