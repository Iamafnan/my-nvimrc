local nvim_lsp = require("lspconfig")
local nvim_lsp_config = require("lspconfig.configs")
local cmp_lsp = require("cmp_nvim_lsp")
local statusline = require("statusline")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
local signature = require("lsp_signature")
local on_attach = function(client, bufnr)
	signature.on_attach()

local opts = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap(bufnr, 'n', '<leader>ld', ':lua vim.lsp.buf.declaration()<CR>', opts)

vim.api.nvim_set_keymap(bufnr, 'n', ',lh', ':Lspsaga hover_doc<CR>', opts)

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

-- Friendly Integration With Luasnip
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { vim.env.HOME .. '/.local/share/nvim/site/pack/packer/start/friendly-snippets'},
    include = { 'javascript', 'typescript', 'vim', 'lua', 'python', 'bash', 'html', 'css', 'json'}
})
