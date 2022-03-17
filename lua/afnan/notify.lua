-- highlights
vim.cmd("hi NotifyBg guifg=#1f2335 guibg=#1f2335")
vim.cmd("hi NotifyFg guifg=#a9b1d6 guibg=#1f2335")
vim.cmd("hi NotifyIcon guifg=#7dcfff guibg=#1f2335")
vim.cmd("hi NotifyTitle guifg=#7dcfff guibg=#1f2335 gui=bold")
vim.cmd([[
   highlight link NotifyERRORBorder NotifyBg
   highlight link NotifyWARNBorder NotifyBg
   highlight link NotifyINFOBorder NotifyBg
   highlight link NotifyDEBUGBorder NotifyBg
   highlight link NotifyTRACEBorder  NotifyBg 
   highlight link NotifyERRORIcon    NotifyIcon
   highlight link NotifyWARNIcon     NotifyIcon
   highlight link NotifyINFOIcon     NotifyIcon
   highlight link NotifyDEBUGIcon    NotifyIcon 
   highlight link NotifyTRACEIcon    NotifyIcon
   highlight link NotifyERRORTitle   NotifyTitle  
   highlight link NotifyWARNTitle    NotifyTitle 
   highlight link NotifyINFOTitle    NotifyTitle 
   highlight link NotifyDEBUGTitle   NotifyTitle
   highlight link NotifyTRACETitle   NotifyTitle
   highlight link NotifyERRORBody NotifyFg
   highlight link NotifyWARNBody NotifyFg
   highlight link NotifyINFOBody NotifyFg
   highlight link NotifyDEBUGBody NotifyFg
   highlight link NotifyTRACEBody NotifyFg
]])

local notify = require("notify")
local default = {
	stages = "fade_in_slide_out",
	render = "default",
	timeout = 2000,
	minimum_width = 10,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "",
	},
}

vim.opt.termguicolors = true

notify.setup(default)

vim.notify = function(msg, level, opts)
	notify(msg, level, opts)
end

function _G.P(...)
	print(vim.inspect(...))
	return ...
end
