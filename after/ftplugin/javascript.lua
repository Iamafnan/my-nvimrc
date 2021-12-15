vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gr",
	[[<cmd>lua require'telescope.builtin'.lsp_references()<CR>
]],
	{ noremap = true, silent = true }
)

vim.b.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets/javascript/")
