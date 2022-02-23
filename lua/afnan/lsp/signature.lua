local border = { " ", " ", " ", " ", " ", " ", " ", " " }

require("lsp_signature").setup({
	hint_enable = false,
	handler_opts = { border = border },
	max_width = 40,
	max_height = 50,
})
