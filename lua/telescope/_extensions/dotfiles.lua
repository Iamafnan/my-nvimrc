local telescope = require("telescope")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local fn = vim.fn
local entry_display = require("telescope.pickers.entry_display")

local function dotfiles_list()
	local root
	if fn.isdirectory("~/.config") then
		root = "~/.config/"
	end
	local dicts = fn.split(fn.globpath(root, "*"))

	return dicts
end

local function finder()
	local results = dotfiles_list()

	for i = 1, math.floor(#results / 2) do
		results[i], results[#results - i + 1] = results[#results - i + 1], results[i]
	end
	local displayer = entry_display.create({
		separator = " ",
		items = {
			{ width = 30 },
			{ remaining = true },
		},
	})

	local function make_display(entry)
		return displayer({ entry.name })
	end

	return finders.new_table({
		results = results,
		entry_maker = function(entry)
			local name = fn.fnamemodify(entry, ":t")
			return {
				display = make_display,
				name = name,
				value = entry,
				ordinal = name .. " " .. entry,
			}
		end,
	})
end

local dotfiles = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Find Dotfiles",
		results_title = "Dotfiles",
		finder = finder(),
		preview = false,
		sorter = conf.generic_sorter(opts),
		attach_mappings = function()
			actions.select_default:replace(function(_)
				local selection = action_state.get_selected_entry()
				if not selection then
					print("[telescope] Nothing currently selected")
					return
				else
					require("telescope.builtin").find_files({ cwd = selection.value })
				end
			end)
			return true
		end,
	}):find()
end

return telescope.register_extension({
	exports = { dotfiles = dotfiles },
})
