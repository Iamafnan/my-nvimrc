-- locals
local nvim_lsp = require("lspconfig")
local nvim_lsp_config = require("lspconfig.configs")
local cmp_lsp = require("cmp_nvim_lsp")
local notify = require("afnan.notifications").lspstarted
local wk = require("which-key")
local ts_utils = require("nvim-lsp-ts-utils")

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
	-- Signature Help
	require("lsp_signature").on_attach()

	-- Notification Msg
	notify(client.name)

	local cmd = vim.api.nvim_command

	-- document highlights
	if client.resolved_capabilities.document_highlight then
		cmd([[ augroup document_highlight ]])
		cmd([[ autocmd! * <buffer> ]])
		cmd([[ autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() ]])
		cmd([[ autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() ]])
		cmd([[ augroup END ]])
	end

   -- Disable formatting
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false

	-- Some keymaps for jsonls
	if client.name == "jsonls" then
		local mappings = {
			p = {
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
		local opts = { prefix = "<space>", icons = { group = "➜" } }
		wk.register(mappings, opts)
	end

   if client.name == "tsserver" then
      ts_utils.setup({
         enable_import_on_completion = true,
         import_all_select_source = true,
         auto_inlay_hints = false,

         -- Eslint
         eslint_enable_code_actions = true,
         eslint_enable_disable_comments = true,
         eslint_bin = "eslint_d",
         eslint_enable_diagnostics = true,
         eslint_opts = {},

         -- Formatting
         enable_formatting = true,
         formatter = "prettierd",
         formatter_opts = {},
      })

      ts_utils.setup_client(client)
   end
end

-- JS / TS
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
   init_options = ts_utils.init_options,
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
	init_options = { provideFormatter = true },
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
nvim_lsp.cssmodules_ls.setup({
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
nvim_lsp.pylsp.setup{{
   on_attach = on_attach,
   capabilities = capabilities,
settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true },
          yapf = { enabled = true },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          pydocstyle = { enabled = false },
        },
      },
   },
}}

-- Vim
nvim_lsp.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Yaml
nvim_lsp.yamlls.setup({
   on_attach = on_attach,
   capabilities = capabilities,
   settings = {
      yaml = {
         schemas = require("schemastore").json.schemas()
      }
   }
})
-- Linting
nvim_lsp.eslint.setup{{
   on_attach = on_attach,
   capabilities = capabilities,
}}
