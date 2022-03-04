local lspsaga = require("lspsaga")

lspsaga.setup({
	debug = false,
	code_action_icon = "• ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_prompt_prefix = "➤",
	rename_action_keys = {
		quit = "<C-c>",
		exec = "<CR>",
	},
	border_style = "single",
})
