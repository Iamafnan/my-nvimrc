vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gr",
	[[<cmd>lua require'telescope.builtin'.lsp_references()<CR>
]],
	{ noremap = true, silent = true }
)
