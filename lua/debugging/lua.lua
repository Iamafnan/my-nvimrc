local dap = require("dap")
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			return "127.0.0.1"
		end,
		port = function()
			local val = 54231
			return val
		end,
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end
