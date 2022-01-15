local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local telescope = require("telescope")
local load = telescope.load_extension

-- Telescope Setup
telescope.setup({
	defaults = {
		vimgrep_arguments = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			horizontal = { mirror = false },
			vertical = { mirror = true },
		},
		file_sorter = sorters.get_fuzzy_file,
		file_ignore_patterns = { "__pycache__", "node_modules" },
		generic_sorter = sorters.get_generic_fuzzy_sorter,
		winblend = 10,
		border = {},
		borderchars = {
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			results = { "─", " ", " ", " ", " ", " ", " ", " " },
		},
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		buffer_previewer_maker = previewers.buffer_previewer_maker,
	},
})

-- Extentions
load("projects")
load("notify")
