local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end
local NullLsDSources = { luacheck = "luacheck" }
local border = prequire("afnan.lsp.utils").borders()
local codes = prequire("afnan.lsp.utils").diagnosticsCode()
local function format(diagnostic)
	if diagnostic.source == NullLsDSources[diagnostic.source] then
		return diagnostic.message
	else
		local code = diagnostic.user_data.lsp.code
		for _, table in pairs(codes) do
			if vim.tbl_contains(table, code) then
				return table.message
			end
		end
		return diagnostic.message
	end
end
local function prefix(diagnostic, i, total)
	local icon, highlight
	if diagnostic.severity == 1 then
		icon = ""
		highlight = "DiagnosticError"
	elseif diagnostic.severity == 2 then
		icon = ""
		highlight = "DiagnosticWarn"
	elseif diagnostic.severity == 3 then
		icon = ""
		highlight = "DiagnosticInfo"
	elseif diagnostic.severity == 4 then
		icon = ""
		highlight = "DiagnosticHint"
	end
	return i .. "/" .. total .. " " .. icon .. "  ", highlight
end
local function wrap_options(custom, handler)
	return function(opts)
		opts = opts and vim.tbl_extend(opts, custom) or custom
		if type(handler) == "string" then
			require("telescope.builtin")[handler](opts)
		else
			handler(opts)
		end
	end
end

-- Diagnostics Setup
vim.diagnostic.config({
	signs = false,
	virtual_text = false,
	update_in_insert = false,
	underline = true,
	float = {
		focusable = false,
		border = border,
		scope = "cursor",
		source = "if_many",
		format = format,
		header = { "Cursor Diagnostics: ", "DiagnosticInfo" },
		pos = 1,
		prefix = prefix,
	},
})

-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

-- Signature Help
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
})

-- Reference
-- Reference: https://github.com/rcarriga/dotfiles/blob/master/.config/nvim/lua/config/lsp/handlers.lua#L16
vim.lsp.handlers["textDocument/references"] = wrap_options({ layout_strategy = "vertical" }, "lsp_references")

-- Document Symbol
-- Reference: https://github.com/rcarriga/dotfiles/blob/master/.config/nvim/lua/config/lsp/handlers.lua#L20
vim.lsp.handlers["textDocument/documentSymbol"] = require("telescope.builtin").lsp_document_symbols

-- Defination
local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		if split_cmd then
			vim.cmd(split_cmd)
		end

		if vim.tbl_islist(result) then
			util.jump_to_location(result[1])

			if #result > 1 then
				util.set_qflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end

	return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

-- LSP Commands
function _G.reload_lsp()
	vim.lsp.stop_client(vim.lsp.get_active_clients())
	vim.cmd([[edit]])
end

function _G.open_lsp_log()
	local path = vim.lsp.get_log_path()
	vim.cmd("edit " .. path)
end

vim.cmd("command! -nargs=0 LspLog call v:lua.open_lsp_log()")
vim.cmd("command! LspRestart call v:lua.reload_lsp()")
