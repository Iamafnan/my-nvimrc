vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opts = { noremap = true , silent = true }

-- basic maps
map('n','w', ':write<CR>' , opts)
map('n', 'q', ':quit<CR>' , opts)
map('', 'i', 'a', opts)
map('', 'k', 'gk', opts)
map('', 'j' , 'gj', opts)
map('n', '<CR>', '<esc>o',  opts )

-- basic visual mode maps
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- for packer.nvim
map('n', '<space>ps', ':PackerSync<CR>', opts )

-- for split movement
map('', '<C-h>', '<C-w>h', opts )
map('', '<C-j>', '<C-w>j', opts )
map('', '<C-k>', '<C-w>k', opts )
map('', '<C-l>', '<C-w>l', opts )

-- for commentary
map('n', 'cm', ':Commentary<CR>', opts)

-- for quick rc sourcing
map('n', 'rcs', ':so %<CR>', opts)

-- for telescope
map('n', ',ff', ':Telescope find_files<CR>', opts)
map('n', ',lg', ':Telescope live_grep<CR>', opts)
map('n', ',gf', ':Telescope git_files<CR>', opts)  
map('n', ',fb', ':Telescope file_browser<CR>', opts)
map('n', ',pr', ':Telescope projects<CR>', opts)
 
-- for lazygit
map('n', 'gh', ':LazyGit<CR>', opts)

-- for sideways
map('n', 'sl', '<ESC>:SidewaysRight<CR>i', opts)
map('n', 'sj', '<ESC>:SidewaysLeft<CR>i', opts)

-- for lsp saga
map('n', 'lsf', ':Lspsaga lsp_finder<CR>', opts)
map('n', 'lsc', ':Lspsaga code_action<CR>', opts)
map('v', 'lsf', ':<C-U>Lspsaga range_code_action<CR>', opts)
map('n', 'lsr', ':Lspsaga rename<CR>', opts)
map('n', '<A-t>', ':Lspsaga open_floaterm<CR>', opts)
