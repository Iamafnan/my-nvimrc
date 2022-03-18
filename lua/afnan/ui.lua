---@diagnostic disable: unused-local
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local Menu = require("nui.menu")
local Text = require("nui.text")
local borders = { " ", " ", " ", " ", " ", " " }
local input_ui

vim.api.nvim_set_hl(0, "NuiTitle", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "NuiTitle", { fg = "#9ece6a", bold = true })

vim.ui.input = function(opts, on_confirm)
	if input_ui then
		vim.api.nvim_err_writeln("busy: another input is pending!")
		return
	end
	local function on_done(value)
		if input_ui then
			input_ui:unmount()
		end
		on_confirm(value)
		input_ui = nil
	end

	local border_top_text = opts.prompt or "[Input]"
	if border_top_text == "New Name: " then
		border_top_text = " Rename "
	end
	local default_value = opts.default

	input_ui = Input({
		relative = "cursor",
		position = {
			row = 1,
			col = 0,
		},
		size = {
			width = math.max(20, type(default_value) == "string" and #default_value or 0),
		},
		border = {
			style = borders,
			highlight = "FloatBorder",
			text = {
				top = Text(border_top_text, "NuiTitle"),
				top_align = "center",
			},
		},
	}, {
		prompt = "> ",
		default_value = default_value,
		on_close = function()
			on_done(nil)
		end,
		on_submit = function(value)
			on_done(value)
		end,
	})

	input_ui:mount()
	input_ui:on(event.BufLeave, function()
		on_done(nil)
	end, { once = true })
	input_ui:map("n", "<Esc>", input_ui.input_props.on_close, { noremap = true })
end

local select_ui = nil
vim.ui.select = function(items, opts, on_choice)
	if select_ui then
		vim.api.nvim_err_writeln("busy: another select is pending!")
		return
	end
	local function on_done(item, index)
		if select_ui then
			select_ui:unmount()
		end
		on_choice(item, index)
		select_ui = nil
	end

	local border_top_text = opts.prompt or "[Choose Item]"
	if border_top_text == "Code actions:" then
		border_top_text = "Code Actions"
	end
	local kind = opts.kind or "unknown"
	local format_item = opts.format_item or tostring

	local relative = "editor"
	local position = "50%"

	if kind == "codeaction" then
		relative = "cursor"
		position = {
			row = 1,
			col = 0,
		}
	end

	local max_width = vim.api.nvim_win_get_width(0)

	local menu_items = {}
	for index, item in ipairs(items) do
		item.index = index
		local item_text = string.sub(format_item(item), 0, max_width - 2)
		table.insert(menu_items, Menu.item(item_text, item))
	end

	select_ui = Menu({
		relative = relative,
		position = position,
		border = {
			style = borders,
			highlight = "FloatBorder",
			text = {
				top = Text(border_top_text, "NuiTitle"),
				top_align = "center",
			},
		},
	}, {
		lines = menu_items,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			on_done(nil, nil)
		end,
		on_submit = function(item)
			on_done(item, item.index)
		end,
	})

	select_ui:mount()
	select_ui:on(event.BufLeave, function()
		on_done(nil, nil)
	end, { once = true })
end

function _G.subUi()
	local default_value = vim.fn.expand("<cword>")
	_G.PatternUi = Input({
		relative = "cursor",
		position = { row = 1, col = 0 },
		size = { width = math.max(20, type(default_value) == "string" and #default_value or 0) },
		border = {
			style = borders,
			highlight = "FloatBorder",
			text = { top = Text("Pattern ", "NuiTitle"), top_align = "center" },
		},
	}, {
		prompt = Text("> ", "NuiPrompt"),
		default_value = default_value,
		on_close = function()
			print("")
		end,
		on_submit = function(value)
			print(value)
		end,
	})
	_G.StringUi = Input({
		relative = "cursor",
		position = { row = 1, col = 0 },
		size = { width = 20 },
		border = {
			style = borders,
			highlight = "FloatBorder",
			text = { top = Text("String", "NuiTitle"), top_align = "center" },
		},
	}, {
		prompt = Text("> ", "NuiPrompt"),
		on_close = function()
			print("")
		end,
		on_submit = function()
			print("")
		end,
	})

	_G.PatternUi:mount()
	_G.StringUi:mount()
end

vim.api.nvim_add_user_command("Substitute", _G.subUi, {})
