local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local luasnips = prequire("luasnip")
local loaders = prequire("luasnip.loaders.from_vscode")

loaders.load({
	path = { "~/.config/custom-snippets/" },
})
loaders.load({
	path = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" },
})
loaders.load({
	path = { "~/.local/share/nvim/site/pack/packer/start/abusaidm.html-snippets-0.0.18/" },
})

luasnips.config.setup({
	history = true,
	updateevents = "InsertLeave",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})
