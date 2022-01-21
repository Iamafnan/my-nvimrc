local utils = {}

---Bind keys with silence
---@param mode string
---@param lhs string
---@param rhs string
utils.set_keymap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

---Creates highlight group in lua
---@param highlightGroup string
---@param guibg string
---@param guifg string
utils.highlight = function(highlightGroup, guibg, guifg)
	vim.cmd("highlight", highlightGroup, "guibg=" .. guibg, "guifg=" .. guifg)
end

return utils
