local notify = require("notify")

-- Nofify Setup
notify.setup({
	stages = "static",
	timeout = 3000,
	render = "minimal",
})

local M = {}

M.lspstarted = function(client)
	if client == "jsonls" then
		vim.notify("")
	else
		notify("Language server: " .. client .. " is ready!", "INFO")
	end
end

M.sourced = function()
	notify("Sucessfully sourced " .. vim.fn.expand("%:~:."), "INFO")
end

return M
