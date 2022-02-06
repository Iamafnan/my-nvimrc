require("nvim-tree").setup({
	diagnostics = { enable = false },
	git = { enable = false },
	view = { hide_root_folder = true },
	update_cwd = true,
	filters = { custom = { ".git", "node_modules", "dist" } },
	auto_close = true,
})

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
	folder = {
		default = "",
		empty = "",
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_special_files = {
	[[ "README.md" = 0 ]],
	[[ "MAKEFILE" = 0 ]],
	[[ "Makefile" = 0 ]],
}
