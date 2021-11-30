local map = require("general.utils").set_keymap
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

map("", "k", "gk")
map("", "j", "gj")
map("n", "<CR>", "<esc>o")

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
	q = { ":q<cr>", "Quit" },
	w = { ":w<cr>", "Save" },
	L = {
		name = "Terminal Things",
		f = { toggle_lf, "Lf" },
		g = { toggle_lazygit, "LazyGit" },
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
		n = { ":Telescope neoclip<CR>", "Neoclip" },
	},
	r = {
		name = "Source",
		c = { ":so %<CR> | :lua require('ui.notifications').sourced('Hello')<CR>", "Source Buffer" },
	},
	b = {
		name = "Buffer",
		q = { ":BufferClose<CR>", "Close buffer" },
		l = { ":BufferNext<CR>", "Next Buffer" },
		r = { ":BufferPrevious<CR>", "Previous Buffer" },
	},
	n = {
		name = "Nerdtree",
		t = { ":NERDTreeToggle<CR>", "Nerdtree" },
		f = { ":NERDTreeFind<CR>", "Nerdtree Find" },
		r = { ":NERDTreeRefreshRoot<CR>", "Nerdtree Refresh" },
	},
	p = {
		name = "Packer",
		u = { ":PackerUpdate<CR>", "Packer Update" },
		c = { ":PackerClean<CR>", "Packer Clean" },
		i = { ":PackerInstall<CR>", "Packer Install" },
	},
	l = {
		name = "LSP",
		r = { ":lua require('renamer').rename()<cr>", "Rename" },
	},
}
local opts = { prefix = ",", icons = { group = "➜" } }
wk.register(mappings, opts)
