local map = vim.api.nvim_set_keymap

-- basic maps
map('n','w', ':write<CR>', { noremap = true })
map('n', 'q', ':quit<CR>', { noremap = true })
map('', 'i', 'a', { noremap = false })
map('', 'k', 'gk', { noremap = false })
map('', 'j' , 'gj', { noremap = false })

-- for buffers movement
map('n', ',q', ':BufferClose<CR>', { noremap = true })
map('n', ',l', ':BufferNext<CR>', { noremap = true })

-- for split movement
map('', '<C-h>', '<C-w>h', { noremap = false } )
map('', '<C-j>', '<C-w>j', { noremap = false } )
map('', '<C-k>', '<C-w>k', { noremap = false } )
map('', '<C-l>', '<C-w>l', { noremap = false } )

-- for commentary
map('n', 'cm', ':Commentary<CR>', { noremap = true })

-- for nvimtree
map('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true })

-- for quick rc sourcing
map('n', 'rcs', ':so ~/.config/nvim/init.vim<CR>', { noremap = false })

-- for telescope
map('n', ',f', ':Telescope find_files<CR>', { noremap = true })
map('n', ',,', ':Telescope live_grep<CR>', { noremap =  true })
