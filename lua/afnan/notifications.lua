local notify = require("notify")

-- Nofify Setup
notify.setup({
	stages = "fade",
})

local M = {}

M.lspstarted = function(client)
	-- Disable notification for jsonls
	if client == "jsonls" then
	else
		notify("Language server: " .. client .. " is ready!", "INFO", { title = "Language Server" })
	end
end

M.sourced = function()
	notify("Sucessfully sourced " .. vim.fn.expand("%:~:."), "INFO", { title = "System Notifications" })
end

return M
