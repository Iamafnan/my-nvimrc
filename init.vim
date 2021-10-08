luafile ~/.config/nvim/configs/lualine.lua
luafile ~/.config/nvim/configs/treesitter.lua
luafile ~/.config/nvim/configs/telescope.lua
luafile ~/.config/nvim/configs/emmet.lua
luafile ~/.config/nvim/configs/vim-js.lua
luafile ~/.config/nvim/configs/shade.lua
luafile ~/.config/nvim/configs/bufferline.lua

lua require('lsp')
lua require('auto-completion')
lua require('general.packer')
lua require('general.settings')
lua require('general.mapping')
lua require('general.autocommands')
