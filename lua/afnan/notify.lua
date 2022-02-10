local notify = require("notify")
local default = {
	-- Animation style (see below for details)
	stages = "fade_in_slide_out", -- "slide",

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = "default",

	-- Default timeout for notifications
	timeout = 5000,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
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

	minimum_width = 50,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
}
notify.setup(default)
