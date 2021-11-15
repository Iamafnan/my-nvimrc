-- Locals
local treesitter = require("nvim-treesitter.configs")
local tsinstall = require("nvim-treesitter.install")
local cmd = vim.cmd

-- Config
treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	autopairs = { enable = true },
	ensure_installed = { "json", "html", "css", "javascript", "lua", "vim", "python", "bash", "comment" },
})

-- Installation Config
tsinstall = {
	prefer_git = true,
}

-- Folds for treesitter
cmd("set foldmethod=expr")
cmd("set foldexpr=nvim_treesitter#foldexpr()")
