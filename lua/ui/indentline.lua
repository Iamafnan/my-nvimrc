vim.opt.list = true
vim.opt.listchars:append("space:⋅")
require("indent_blankline").setup({
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = { "dashboard", "nerdtree", "packer", "help", "markdown" },
	show_current_context = true,
	use_treesitter = true,
})
vim.highlight.create("IndentBlacklineContextChar", { guifg = "#363948", guibg = "nocombile" }, false)
