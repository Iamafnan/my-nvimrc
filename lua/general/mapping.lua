local map = require("general.utils").set_keymap

-- basic maps
map("n", "w", ":write<CR>")
map("n", "q", ":quit<CR>")
map("", "i", "a")
map("", "k", "gk")
map("", "j", "gj")
map("n", "<CR>", "<esc>o")

-- single line movement
map("n", "<A-left>", "^")
map("n", "<A-right>", "$")
map("i", "<A-right>", "<ESC>$ i")
map("i", "<A-left>", "<ESC>^ i")

-- basic visual mode maps
map("v", "<", "<gv")
map("v", ">", ">gv")

-- terminal maps
vim.cmd([[ function! OpenTerminal()
  split term://zsh
  resize 10
endfunction ]])
map("n", "<A-t>", ":call OpenTerminal()<CR>")
map("t", "<ESC>", "<C-\\><C-n>")

-- for packer.nvim
map("n", ",pi", ":PackerInstall<CR>")
map("n", ",pu", ":PackerUpdate<CR>")
map("n", ",pc", ":PackerClean<CR>")

-- File Explorer
map("n", "nt", ":NERDTreeToggle<CR>")
map("n", "nr", ":NERDTreeRefreshRoot<CR>")
map("n", "nf", ":NERDTreeFind<CR>")

-- for split movement
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- for buffer navigation
map("n", ",q", ":BufferClose<CR>")
map("n", ",<right>", ":BufferNext<CR>")
map("n", ",<left>", ":BufferPrevious<CR>")

-- for quick rc sourcing
map("n", "rcs", ":so %<CR>")

-- for telescope
map("n", ",tf", ":Telescope find_files<CR>")
map("n", ",tr", ":Telescope live_grep<CR>")
map("n", ",tp", ":Telescope projects<CR>")
map("n", ",tn", ":Telescope neoclip<CR>")

-- for lazygit
map("n", "gh", ":LazyGit<CR>")
