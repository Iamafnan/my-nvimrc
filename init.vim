source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mapping.vim

" Plug Configs
source ~/.config/nvim/plug-configs/devicons.vim
source ~/.config/nvim/plug-configs/barber.vim
luafile ~/.config/nvim/plug-configs/lualine.lua
luafile ~/.config/nvim/plug-configs/nvim-tree.lua
luafile ~/.config/nvim/plug-configs/rest-nvim.lua
luafile ~/.config/nvim/plug-configs/completion.lua

" Lsp Related
luafile ~/.config/nvim/plug-configs/lsp/lsp-config.lua
luafile ~/.config/nvim/plug-configs/lsp/lsp-saga.lua
luafile ~/.config/nvim/plug-configs/lsp/treesitter.lua
luafile ~/.config/nvim/plug-configs/lsp/completion.lua
