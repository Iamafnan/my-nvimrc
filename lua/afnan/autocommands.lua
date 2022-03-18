local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

cmd("BufEnter", {
	desc = "Disable Autocommenting",
	command = "set fp-=c fo-=r fo-=o",
})

augroup("_term", {})

cmd("TermOpen", {
	desc = "Auto Insert",
	group = "_term",
	command = "startinsert",
})

cmd("TermOpen", {
	desc = "Unset numbers",
	group = "_term",
	command = "setlocal nonu",
})

augroup("_buffer", {})

---@diagnostic disable-next-line: unused-local
local NoWhitespace = vim.api.nvim_exec(
	[[
    function! NoWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfunction
    call NoWhitespace()
    ]],
	true
)

cmd("BufWritePre", {
	desc = "Trim whitespace on save",
	group = "_buffer",
	command = [[call NoWhitespace()]],
})

cmd("TextYankPost", {
	desc = "Highlight while yanking",
	group = "_buffer",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual" })
	end,
})

augroup("_lsp", {})
cmd({ "CursorHold" }, {
	desc = "Open float when there is diagnostics",
	group = "_lsp",
	callback = vim.diagnostic.open_float,
})
