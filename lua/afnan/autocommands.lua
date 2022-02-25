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
	autoInsert = { {
		"BufEnter",
		"*",
		"if &buftype == 'terminal' | :startinsert | endif",
	} },
	YankHighlight = { {
		"TextYankPost",
		"*",
		"silent! lua vim.highlight.on_yank(",
	} },
	Diagnostic = {
		{
			"CursorHold",
			"*",
			"lua vim.diagnostic.open_float(0, {focusable = false, scope = 'line', source = 'if_many'})",
		},
	},
}

nvim_create_augroups(autocmds)
