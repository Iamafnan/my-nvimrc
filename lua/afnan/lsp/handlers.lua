-- Diagnostics Setup
local codes = {
	no_matching_function = {
		message = " Can't find a matching function",
		"redundant-parameter",
		"ovl_no_viable_function_in_call",
	},
	empty_block = {
		message = " That shouldn't be empty here",
		"empty-block",
	},
	missing_symbol = {
		message = " Here should be a symbol",
		"miss-symbol",
	},
	expected_semi_colon = {
		message = " Remember the `;` or `,`",
		"expected_semi_declaration",
		"miss-sep-in-table",
		"invalid_token_after_toplevel_declarator",
	},
	redefinition = {
		message = " That variable was defined before",
		"redefinition",
		"redefined-local",
	},
	no_matching_variable = {
		message = " Can't find that variable",
		"undefined-global",
		"reportUndefinedVariable",
	},
	trailing_whitespace = {
		message = " Remove trailing whitespace",
		"trailing-whitespace",
		"trailing-space",
	},
	unused_variable = {
		message = " Don't define variables you don't use",
		"unused-local",
	},
	unused_function = {
		message = " Don't define functions you don't use",
		"unused-function",
	},
	useless_symbols = {
		message = " Remove that useless symbols",
		"unknown-symbol",
	},
	wrong_type = {
		message = " Try to use the correct types",
		"init_conversion_failed",
	},
	undeclared_variable = {
		message = " Have you delcared that variable somewhere?",
		"undeclared_var_use",
	},
	lowercase_global = {
		message = " Should that be a global? (if so make it uppercase)",
		"lowercase-global",
	},
}

local NullLsDSources = {
	luacheck = "luacheck",
}

local border = { " ", " ", " ", " ", " ", " ", " ", " " }

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
		format = function(diagnostic)
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
		end,
		header = { "Cursor Diagnostics:", "DiagnosticHeader" },
		pos = 1,
		prefix = function(diagnostic, i, total)
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
		end,
	},
})

-- Autoshow diagnostics
vim.api.nvim_exec(
	[[
  augroup ShowDiagnosticFloat
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(0, {focusable = false, scope = 'line', source = 'if_many'})
  augroup end
]],
	false
)

-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

-- Open defination in split window
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

function _G.reload_lsp()
	vim.lsp.stop_client(vim.lsp.get_active_clients())
	vim.cmd([[edit]])
end

function _G.open_lsp_log()
	local path = vim.lsp.get_log_path()
	vim.cmd("edit " .. path)
end

vim.cmd("command! -nargs=0 LspLog call v:lua.open_lsp_log()")
vim.cmd("command! -nargs=0 LspRestart call v:lua.reload_lsp()")

-- local function PeekDefinition()
--   if vim.tbl_contains(vim.api.nvim_list_wins(), floating_win) then
--     vim.api.nvim_set_current_win(M.floating_win)
--   else
--     local params = vim.lsp.util.make_position_params()
--     return vim.lsp.buf_request(0, "textDocument/definition", params, M.preview_location_callback)
--   end
-- end
