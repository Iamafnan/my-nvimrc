local function set_keymap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end
local wk = require("which-key")

set_keymap("", "k", "gk")
set_keymap("", "j", "gj")
set_keymap("n", "<CR>", "<esc>o")
set_keymap("n", "q", ":q<CR>")
set_keymap("n", "w", ":w<CR>")
set_keymap("n", "<space>", ":")
set_keymap("v", "<space>", ":")

-- single line movement
set_keymap("n", "<A-left>", "0")
set_keymap("n", "<A-right>", "$")
set_keymap("i", "<A-right>", "<ESC>$ i")
set_keymap("i", "<A-left>", "<ESC>0 i")

-- basic visual mode maps
set_keymap("v", "<", "<gv")
set_keymap("v", ">", ">gv")

set_keymap("t", "<ESC>", "<C-\\><C-n>")

-- for split movement
set_keymap("", "<C-h>", "<C-w>h")
set_keymap("", "<C-j>", "<C-w>j")
set_keymap("", "<C-k>", "<C-w>k")
set_keymap("", "<C-l>", "<C-w>l")

set_keymap("n", "Y", "y$")

set_keymap("n", "ng", ":Neogen<CR>")

--Some custom completion
set_keymap("i", "<C-c>", "<C-x><C-v>")
set_keymap("i", "<C-f>", "<C-x><C-f>")

-- Some lsp keymaps
set_keymap("n", "K", ":Lspsaga hover_doc<CR>")
set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
set_keymap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>")
set_keymap("n", "gk", ":lua vim.diagnostic.goto_next()<CR>")
set_keymap("n", "gj", ":lua vim.diagnostic.goto_prev()<CR>")
set_keymap("n", "gR", ":lua vim.lsp.buf.references()<CR>")
set_keymap("n", "gr", ":Lspsaga rename<CR>")
set_keymap("n", "ga", ":Lspsaga code_action<CR>")
-- set_keymap("n", "gF", ":lua vim.lsp.buf.formatting()<CR>")

local mappings = {
	g = {
		name = "Gitsigns",
		h = {
			name = "Hunk",
			n = { ":Gitsigns next_hunk<CR>", "Next Hunk" },
			p = { ":Gitsigns prev_hunk<CR>", "Previous Hunk" },
			s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			u = { ":Gitsigns undo_stage_hunk<CR>", "Unstage Hunk" },
			r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
		},
		b = { name = "Buffer", s = { ":Gitsigns stage_buffer<CR>", "Stage Buffer" } },
		p = { name = "Preview", h = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" } },
	},
	z = { ":ZenMode<cr>", "ZenMode" },
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Find Files" },
		r = { ":Telescope live_grep<CR>", "Grep" },
		n = { ":lua require('github-notifications.menu').notifications()<CR>", "Github Notifications" },
		h = { ":Telescope help_tags<CR>", "Help tags" },
		d = { ":Telescope diagnostics<cr>", "WorkSpace Diagnostics" },
	},
	r = {
		name = "Source",
		c = { ":so %<CR>", "Source Buffer" },
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
}
local opts = { prefix = ",", icons = { group = "➜" } }
wk.register(mappings, opts)
