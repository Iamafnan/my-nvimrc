local function sort_by_mtime(a, b)
	local astat = vim.loop.fs_stat(a.path)
	local bstat = vim.loop.fs_stat(b.path)
	local mod_a = astat and astat.mtime.sec or 0
	local mod_b = bstat and bstat.mtime.sec or 0
	return mod_a > mod_b
end

require("bufferline").setup({
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		sort_by = sort_by_mtime,
		indicator_icon = "  ",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				text_align = "center",
			},
		},
		buffer_close_icon = "",
		modified_icon = "●",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		custom_filter = function(buf_number)
			if vim.bo[buf_number].filetype ~= "dashboard" then
				return true
			end
		end,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		right_trunc_marker = "",
		always_show_bufferline = true,
		separator_style = "slant",
		highlights = {
			fill = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "StatusLineNC" },
			},
			background = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "StatusLine" },
			},
			buffer_visible = {
				gui = "",
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			buffer_selected = {
				gui = "",
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			separator = {
				guifg = { attribute = "bg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "StatusLine" },
			},
			separator_selected = {
				guifg = { attribute = "fg", highlight = "Special" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			separator_visible = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "StatusLineNC" },
			},
			close_button = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "StatusLine" },
			},
			close_button_selected = {
				guifg = { attribute = "fg", highlight = "normal" },
				guibg = { attribute = "bg", highlight = "normal" },
			},
			close_button_visible = {
				guifg = { attribute = "fg", highlight = "normal" },
				guibg = { attribute = "bg", highlight = "normal" },
			},
		},
	},
})
