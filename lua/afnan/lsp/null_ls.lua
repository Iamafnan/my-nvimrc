local null_ls = require("null-ls")
local notify = require("afnan.notifications").lspstarted

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.prettier.with({
			filetypes = { "html", "css", "javascript", "javascriptreact", "markdown", "json", "yaml" },
		}),
		formatting.black,
		formatting.eslint_d,
		formatting.stylua,
		formatting.shfmt.with({
			filetypes = { "bash", "zsh", "sh" },
		}),

		diagnostics.eslint_d,
		diagnostics.luacheck,
		diagnostics.mdl,
		diagnostics.vint,

		codeactions.eslint_d,
	},
	on_attach = function(client)
		notify(client.name)
	end,
})
