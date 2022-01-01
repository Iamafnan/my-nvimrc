-- Locals
local treesitter = require("nvim-treesitter.configs")
local tsinstall = require("nvim-treesitter.install")

-- Config
treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	rainbow = { enable = true, extended_mode = false },
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
	autotag = { enable = true, filetypes = { "html", "javascript", "javascriptreact" } },
	ensure_installed = { "json", "html", "css", "javascript", "lua", "vim", "python", "bash", "comment", "markdown" },
	textobjects = {
		select = {
			enable = true,
			lookahead = false,
		},
	},
})

-- Installation Config
tsinstall = { prefer_git = true }
