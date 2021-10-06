local map = vim.api.nvim_set_keymap

-- basic maps
map('n','w', ':write<CR> | :lua require("notify")("Succesfully saved your file")<CR>', { noremap = true , silent = true })
map('n', 'q', ':quit<CR>', { noremap = true , silent = true })
map('', 'i', 'a', { noremap = false })
map('', 'k', 'gk', { noremap = false })
map('', 'j' , 'gj', { noremap = false })
map('n', '<CR>', '<esc>o', { silent = true, noremap = true } )

-- for buffers movement
map('n', ',q', ':BufferClose<CR>', { noremap = true , silent = true})
map('n', ',l', ':BufferNext<CR>', { noremap = true , silent = true })

-- for split movement
map('', '<C-h>', '<C-w>h', { noremap = false , silent = true } )
map('', '<C-j>', '<C-w>j', { noremap = false , silent = true } )
map('', '<C-k>', '<C-w>k', { noremap = false , silent = true } )
map('', '<C-l>', '<C-w>l', { noremap = false , silent = true } )

-- for commentary
map('n', 'cm', ':Commentary<CR>', { noremap = true , silent = true })

-- for nvimtree
map('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true , silent = true })

-- for quick rc sourcing
map('n', 'rcs', ':so ~/.config/nvim/init.vim<CR> | :lua require("notify")("Succesfully Reloaded init.vim")<CR>', { noremap = false , silent = true })

-- for telescope
map('n', ',ff', ':Telescope find_files<CR>', { noremap = true , silent = true })
map('n', ',lg', ':Telescope live_grep<CR>', { noremap =  true , silent = true})
map('n', ',gf', ':Telescope git_files<CR>', { noremap = true , silent = true })

-- for lazygit
map('n', 'gh', ':LazyGit<CR>', { noremap = true , silent = true })
