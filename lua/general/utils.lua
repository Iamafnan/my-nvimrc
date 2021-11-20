local utils = {}

utils.set_keymap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

-- utils.on_attach = function(client, bufnr)
--         require('')
-- end

return utils
