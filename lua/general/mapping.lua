vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- basic maps
map("n", "w", ":write<CR>", opts)
map("n", "q", ":quit<CR>", opts)
map("", "i", "a", opts)
map("", "k", "gk", opts)
map("", "j", "gj", opts)
map("n", "<CR>", "<esc>o", opts)

-- single line movement
map("n", "<A-left>", "^", opts)
map("n", "<A-right>", "$", opts)
map("i", "<A-right>", "<ESC>$ i", opts)
map("i", "<A-left>", "<ESC>^ i", opts)

-- basic visual mode maps
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- for packer.nvim
map("n", ",pi", ":PackerInstall<CR>", opts)
map("n", ",pu", ":PackerUpdate<CR>", opts)
map("n", ",pc", ":PackerClean<CR>", opts)

-- File Explorer
map("n", "nt", ":NERDTreeToggle<CR>", opts)
map("n", "nr", ":NERDTreeRefreshRoot<CR>", opts)
map("n", "nf", ":NERDTreeFind<CR>", opts)

-- for split movement
map("", "<C-h>", "<C-w>h", opts)
map("", "<C-j>", "<C-w>j", opts)
map("", "<C-k>", "<C-w>k", opts)
map("", "<C-l>", "<C-w>l", opts)

-- for buffer navigation
map("n", ",q", ":BufferClose<CR>", opts)
map("n", ",<right>", ":BufferNext<CR>", opts)
map("n", ",<left>", ":BufferPrevious<CR>", opts)

-- for quick rc sourcing
map("n", "rcs", ":so %<CR>", opts)

-- for telescope
map("n", ",tf", ":Telescope find_files<CR>", opts)
map("n", ",tr", ":Telescope live_grep<CR>", opts)
map("n", ",tp", ":Telescope projects<CR>", opts)
map("n", ",tn", ":Telescope neoclip<CR>", opts)

-- for lazygit
map("n", "gh", ":LazyGit<CR>", opts)
