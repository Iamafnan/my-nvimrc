local ekaput = require("e-kaput")

-- Diagnostic Floating Window Setup
ekaput.setup({ borders = false, transparency = 0 })

-- Basic Diagnostics Setup
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = true,
	update_in_insert = true,
})
