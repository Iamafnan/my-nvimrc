local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.shfmt.with({
			filetypes = { "bash", "zsh", "sh" },
		}),
	},
	on_attach = function(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.formatting_seq_sync(nil, 4000)
				end,
				buffer = bufnr,
			})
		end
	end,
})
