---@diagnostic disable: unused-local
local loader = require("packer").loader

math.randomseed(os.time())

function Lazyload()
	_G.Ploader = loader

	local lazy_timer = 30
	if _G.packer_plugins == nil or _G.packer_plugins["packer.nvim"] == nil then
		print("recompile")
		vim.cmd([[PackerCompile]])
		vim.defer_fn(function()
			print("Packer recompiled, please run `:PackerCompile` and restart nvim")
		end, 1000)
		return
	end

	loader("nvim-notify")
	vim.notify = require("notify")

   print("Done :)") 
   
end

Lazyload()
