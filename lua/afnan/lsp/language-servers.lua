local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local nvim_lsp = prequire("lspconfig")
local nvim_lsp_config = prequire("lspconfig.configs")
local capabilities = require("afnan.lsp.utils").capabilities()
local on_attach = require("afnan.lsp.utils").on_attach

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
	single_file_support = true,
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
	filetypes = { "html" },
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
-- nvim_lsp.bashls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "zsh", "bash", "sh" },
-- })

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
				globals = { "vim", "it", "describe", "before_each" },
				disable = { "trailing-space", "deprecated", "lowercase-global" },
			},
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
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
