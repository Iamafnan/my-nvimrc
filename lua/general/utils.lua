local utils = {}

utils.set_keymap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

utils.highlight = function(highlightGroup, guibg, guifg) 
   vim.cmd("highlight", highlightGroup, "guibg=" .. guibg, "guifg=" .. guifg)
end

return utils
