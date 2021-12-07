local mappings_utils = require("renamer.mappings.utils")
require("renamer").setup({
	show_refs = true,
	with_qf_list = true,
	with_popup = false,
	mappings = {
		["<c-i>"] = mappings_utils.set_cursor_to_start,
		["<c-a>"] = mappings_utils.set_cursor_to_end,
		["<c-e>"] = mappings_utils.set_cursor_to_word_end,
		["<c-b>"] = mappings_utils.set_cursor_to_word_start,
		["<c-c>"] = mappings_utils.clear_line,
		["<c-U>"] = mappings_utils.undo,
		["<c-R>"] = mappings_utils.redo,
	},
	handler = nil,
})
