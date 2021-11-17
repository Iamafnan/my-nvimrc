-- Locals
local treesitter = require("nvim-treesitter.configs")
local tsinstall = require("nvim-treesitter.install")

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
	context_commentstring = { enable = true },
})

-- Installation Config
tsinstall = {
	prefer_git = true,
}
