local ok, notify = pcall(require, "notify")
if not ok then
   return
end

-- Nofify Setup
notify.setup({
	stages = "static",
	timeout = 3000,
	render = "minimal",
})

require("telescope").load_extension("notify")

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
