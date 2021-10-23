local nvim_lsp = require("lspconfig")
local nvim_lsp_config = require("lspconfig.configs")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
local signature = require("lsp_signature")
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	signature.on_attach()
	vim.api.nvim_buf_set_keymap(bufnr, "n", "sh", '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "sp", ":Lspsaga preview_definition<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "sd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
end

-- JS / TS
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- JSON
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- HTML & CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp_config.emmet_ls = {
	default_config = {
		cmd = { "emmet-ls", "--stdio" },
		filetypes = { "html", "css" },
		root_dir = function(fname)
			return vim.loop.cwd()
		end,
		settings = {},
	},
}
nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Bash / Zsh
nvim_lsp.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Vim
nvim_lsp.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
