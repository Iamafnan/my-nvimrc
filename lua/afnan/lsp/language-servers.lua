local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local nvim_lsp = prequire("lspconfig")
local nvim_lsp_config = prequire("lspconfig.configs")
local cmp_lsp = prequire("cmp_nvim_lsp")
local wk = prequire("which-key")

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
capabilities.textDocument.codeAction = {
	dynamicRegistration = true,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = {
				"",
				"quickfix",
				"refactor",
				"refactor.extract",
				"refactor.inline",
				"refactor.rewrite",
				"source",
				"source.organizeImports",
			},
		},
	},
}

-- On_attach
local on_attach = function(client)
	-- Signature Help
	require("lsp_signature").on_attach()

	local cmd = vim.api.nvim_command

	-- Disable formatting
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	-- document highlights
	if client.resolved_capabilities.document_highlight then
		cmd([[ augroup document_highlight ]])
		cmd([[ autocmd! * <buffer> ]])
		cmd([[ autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() ]])
		cmd([[ autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() ]])
		cmd([[ augroup END ]])
	end

	-- Some keymaps for jsonls
	if client.name == "jsonls" then
		local mappings = {
			P = {
				name = "Package Info",
				s = { ":lua require('package-info').show()<CR>", "Show Package Version" },
				h = { ":lua require('package-info').hide()<CR>", "Hide Package Version" },
				u = { ":lua require('package-info').update()<CR>", "Update Package" },
				d = { ":lua require('package-info').delete()<CR>", "Delete Package" },
				i = { ":lua require('package-info').install()<CR>", "Install New Package" },
				r = { ":lua require('package-info').reinstall()<CR>", "Reinstall Package" },
				c = { ":lua require('package-info').change_version()<CR>", "Change Package Version" },
			},
		}
		local opts = { prefix = ",", icons = { group = "➜" } }
		wk.register(mappings, opts)
	end
end

-- JS / TS
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	init_options = {
		preferences = {
			includeCompletionsWithSnippetText = true,
			includeCompletionsForImportStatements = true,
		},
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
})

-- JSON
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = { provideFormatter = false },
	single_file_support = true,
	settings = {
		json = { schemas = require("schemastore").json.schemas() },
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

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

if not nvim_lsp_config.ls_emmet then
	nvim_lsp_config.ls_emmet = {
		default_config = {
			cmd = { "ls_emmet", "--stdio" },
			filetypes = { "html" },
			root_dir = function()
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end
nvim_lsp.ls_emmet.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Bash / Zsh
nvim_lsp.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "zsh", "bash", "sh" },
})

-- Yaml
nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = require("schemastore").json.schemas(),
			hover = true,
			completion = true,
			validate = true,
		},
	},
})
-- Linting
-- nvim_lsp.eslint.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		eslint = {
-- 			enable = true,
-- 			packageManager = "yarn",
-- 			autoFixOnSave = true,
-- 			codeActionsOnSave = {
-- 				mode = "all",
-- 				rules = { "!debugger", "!no-only-tests/*" },
-- 			},
-- 			lintTask = { enable = true },
-- 		},
-- 	},
-- })

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "single" },
				disable = { "trailing-space", "deprecated" },
			},
		},
		completion = {
			showWord = "Disable",
		},
	},
})
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
