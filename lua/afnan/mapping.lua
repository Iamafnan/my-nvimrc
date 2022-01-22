local map = require("afnan.utils").set_keymap
local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local toggle_lazygit = function()
	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
	return lazygit:toggle()
end
local toggle_lf = function()
	local lf = Terminal:new({ cmd = "lf", direction = "float" })
	return lf:toggle()
end

local toggle_ncdu = function()
	local ncdu = Terminal:new({ cmd = "ncdu", direction = "float" })
	return ncdu:toggle()
end

map("", "k", "gk")
map("", "j", "gj")
map("n", "<CR>", "<esc>o")
map("n", "q", ":q<CR>")
map("n", "w", ":w<CR>")

-- single line movement
map("n", "<A-left>", "0")
map("n", "<A-right>", "$")
map("i", "<A-right>", "<ESC>$ i")
map("i", "<A-left>", "<ESC>0 i")

-- basic visual mode maps
map("v", "<", "<gv")
map("v", ">", ">gv")

map("t", "<ESC>", "<C-\\><C-n>")

-- for split movement
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

local mappings = {
	L = {
		name = "Terminal Things",
		f = { toggle_lf, "Lf" },
		g = { toggle_lazygit, "LazyGit" },
		n = { toggle_ncdu, "Ncdu" },
	},
	g = {
		name = "Gitsigns",
		h = {
			name = "Hunk",
			n = { ":Gitsigns next_hunk<CR>", "Next Hunk" },
			p = { ":Gitsigns prev_hunk<CR>", "Previous Hunk" },
			s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			u = { ":Gitsigns undo_stage_hunk<CR>", "Unstage Hunk" },
		},
		b = { name = "Buffer", s = { ":Gitsigns stage_buffer<CR>", "Stage Buffer" } },
		p = { name = "Preview", h = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" } },
	},
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Find Files" },
		r = { ":Telescope live_grep<CR>", "Grep" },
		p = { ":Telescope projects<CR>", "Projects" },
		n = { ":Telescope ghn<CR>", "Github Notifications" },
		h = { ":Telescope help_tags<CR>", "Help tags" },
	},
	r = {
		name = "Source",
		c = { ":so %<CR> | :lua require('afnan.notifications').sourced('Hello')<CR>", "Source Buffer" },
	},
	b = {
		name = "Buffer",
		q = { ":bdelete! <CR>", "Close buffer" },
		["1"] = { ":BufferLineGoToBuffer 1<CR>", "Go to buffer 1" },
		["2"] = { ":BufferLineGoToBuffer 2<CR>", "Go to buffer 2" },
		["3"] = { ":BufferLineGoToBuffer 3<CR>", "Go to buffer 3" },
		["4"] = { ":BufferLineGoToBuffer 4<CR>", "Go to buffer 4" },
		["5"] = { ":BufferLineGoToBuffer 5<CR>", "Go to buffer 5" },
		["6"] = { ":BufferLineGoToBuffer 6<CR>", "Go to buffer 6" },
	},
	n = {
		name = "NvimTree",
		t = { ":NvimTreeToggle<CR>", "NvimTree Toggle" },
		f = { ":NvimTreeFind<CR>", "NvimTree Find" },
	},
	p = {
		name = "Packer",
		u = { ":PackerUpdate<CR>", "Update" },
		c = { ":PackerClean<CR>", "Clean" },
		i = { ":PackerInstall<CR>", "Install" },
		p = { ":PackerCompile<CR>", "Compile" },
		s = { ":PackerSync<CR>", "Sync" },
	},
	l = {
		name = "LSP",
		r = { ":Lspsaga rename<CR>", "Rename" },
		d = { ":lua vim.lsp.buf.definition()<CR>", "Defination" },
		I = { ":lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		c = { ":Lspsaga code_action<CR>", "Code Action" },
		R = { ":lua vim.lsp.buf.references()<CR>", "Reference" },
		K = { ":Lspsaga hover_doc<CR>", "Hover" },
		f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
		n = { ":NullLsInfo<CR>", "Attached Sources" },
		i = { ":LspInfo<CR>", "Attached LSP" },
		s = { ":CmpStatus<CR>", "Completion Sources" },
		k = { ":lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		j = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
	},
}
local opts = { prefix = ",", icons = { group = "➜" } }
wk.register(mappings, opts)
