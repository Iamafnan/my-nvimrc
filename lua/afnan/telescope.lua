local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local telescope = require("telescope")
local load = telescope.load_extension
local project = require("project_nvim")

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
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "__pycache__", "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 10,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

-- Extentions
load("projects")
load("neoclip")
load("sessions")
load("notify")
load("ui-select")
