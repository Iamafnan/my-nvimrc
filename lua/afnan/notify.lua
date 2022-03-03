local notify = require("notify")
local default = {
	stages = "fade_in_slide_out",
	render = "default",
	timeout = 2000,
	background_colour = function()
		local group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg#")
		if group_bg == "" or group_bg == "none" then
			group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Float")), "bg#")
			if group_bg == "" or group_bg == "none" then
				return "#000000"
			end
		end
		return group_bg
	end,

	minimum_width = 10,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
}

vim.opt.termguicolors = true

notify.setup(default)

vim.notify = function(msg, level, opts)
	notify(msg, level, opts)
end

function P(...)
	print(vim.inspect(...))
	return ...
end
