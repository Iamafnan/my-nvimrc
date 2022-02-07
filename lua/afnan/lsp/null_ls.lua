local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = { "html", "css", "javascript", "javascriptreact", "markdown", "json", "yaml" },
		}),
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.stylua,
		formatting.shfmt.with({
			filetypes = { "bash", "zsh", "sh" },
		}),
	},
})
