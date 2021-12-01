-- locals
local nvim_lsp = require("lspconfig")
local nvim_lsp_config = require("lspconfig.configs")
local cmp_lsp = require("cmp_nvim_lsp")
local signature = require("lsp_signature")
local notify = require("ui.notifications").lspstarted

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

-- On_attach
local on_attach = function(client, bufnr)
	signature.on_attach()
	notify(client.name)
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
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	init_options = {
		provideFormatter = true,
	},
	single_file_support = true,
	settings = {
		json = {
			schemas = {
				{
					description = "Package JSON",
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					description = "ESLINT Config File",
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc",
				},
				{
					description = "Prettier Config File",
					fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
					url = "https://json.schemastore.org/prettierrc",
				},
            }
		},
	},
})

-- HTML & CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Bash / Zsh
nvim_lsp.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "zsh", "bash", "sh" },
})

-- Python
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			disableOrganizeImports = false,
			analysis = {
				typeCheckingMode = "basic",
				reportUnusedImport = true,
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

-- Vim
nvim_lsp.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
