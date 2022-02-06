local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

local autocmds = {
	packer = { {
		"BufWritePost",
		"plugins.lua",
		"source % | PackerCompile",
	} },

	autocenter = { {
		"InsertEnter",
		"*",
		"norm zz",
	} },
	autoInsert = { {
		"BufEnter",
		"*",
		"if &buftype == 'terminal' | :startinsert | endif",
	} },
}

nvim_create_augroups(autocmds)
