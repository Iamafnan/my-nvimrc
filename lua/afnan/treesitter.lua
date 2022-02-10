local treesitter = require("nvim-treesitter.configs")
local tsinstall = require("nvim-treesitter.install")
-- Config
treesitter.setup({
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	indent = { enable = true, disable = "yaml" },
	rainbow = { enable = true, extended_mode = false },
	context_commentstring = { enable = true, enable_autocmd = false },
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
	autotag = { enable = true, filetypes = { "html", "javascript", "javascriptreact", "markdown" } },
	ensure_installed = { "json", "html", "css", "javascript", "lua", "vim", "python", "bash", "comment" },
})

-- Installation Config
tsinstall.prefer_git = true
