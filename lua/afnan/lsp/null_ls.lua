local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = { "html", "css", "javascript", "javascriptreact", "markdown", "json", "yaml" },
		}),
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.eslint_d,
		formatting.stylua,
		formatting.shfmt.with({
			filetypes = { "bash", "zsh", "sh" },
		}),

		diagnostics.eslint_d,
		diagnostics.mdl,
		diagnostics.vint,

		codeactions.eslint_d,
		codeactions.gitsigns,
	},
})
