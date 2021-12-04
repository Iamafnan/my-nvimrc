vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"grn",
	[[<cmd>lua vim.lsp.buf.rename()<CR>
]],
	{ noremap = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<space>f",
	[[<cmd>lua vim.lsp.buf.formatting()<CR>
]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<c-]>",
	[[<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>
]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gr",
	[[<cmd>lua require'telescope.builtin'.lsp_references()<CR>
]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(0, "n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]], { noremap = true, silent = true })

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<c-k>",
	[[<cmd>lua vim.lsp.buf.signature_help()<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gd",
	[[<cmd>lua vim.lsp.buf.type_definition()<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(0, "n", "ga", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {
	noremap = true,
	silent = true,
})

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"g0",
	[[<cmd>lua vim.lsp.buf.document_symbol()<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"gW",
	[[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(0, "n", "1gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]], {
	noremap = true,
	silent = true,
})

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"ge",
	[[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]],
	{ noremap = true, silent = true }
)

-- Goto previous/next diagnostic warning/error
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"g[",
	[[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"g]",
	[[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]],
	{ noremap = true, silent = true }
)
-- snippets dir
vim.b.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets/javascript/")

-- define LSP signs
vim.fn.sign_define("DiagnosticSignError", {
	text = "",
	texthl = "DiagnosticSignError",
})

vim.fn.sign_define("DiagnosticSignWarn", {
	text = "",
	texthl = "DiagnosticSignWarn",
})

vim.fn.sign_define("DiagnosticSignHint", {
	text = "",
	texthl = "DiagnosticSignHint",
})

-- Show diagnostic float on CursorHold but don't steal cursor
vim.api.nvim_exec(
	[[
  augroup ShowDiagnosticFloat
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(0, {focusable = false, scope = 'line', source = 'always'})
  augroup end
]],
	false
)
