local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local telescope = require("telescope")
local load = telescope.load_extension
local project = require("project_nvim")

-- Telescope Setup
telescope.setup({
	defaults = {
		layout_config = {
			width = 0.75,
			prompt_position = "top",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_sorter = sorters.get_fuzzy_file,
		file_ignore_patterns = { "node_modules", ".git" },
		generic_sorter = sorters.get_generic_fuzzy_sorter,
		path_display = {},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		buffer_previewer_maker = previewers.buffer_previewer_maker,
		mappings = {
			i = {
				["<CR>"] = actions.select_default + actions.center,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
})

-- Projecr.nvim Setup
project.setup({
	manual_mode = false,
	detection_method = { "lsp", "pattern" },
	update_cwd = true,
	pattern = { "package.json" },
	show_hidden = true,
	silent_chdir = true,
	datapath = vim.fn.stdpath("data"),
	exclude_dirs = { "./node_modules/*" },
})



-- Extentions
load("projects")
load("neoclip")
load("sessions")
load("notify")
