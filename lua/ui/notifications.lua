local notify = require("notify")
local filetype = vim.bo.filetype

local M = {}

M.lspstarted = function(client)
	notify("Language server:" .. client .. " is ready!", "INFO", { title = "Language Server" })
end

M.sourced = function()
	notify("Sucessfully sourced the file", "INFO", { title = "System Notifications" })
end

-- M.

return M
