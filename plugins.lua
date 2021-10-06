vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

-- Colorschemes
use {'dracula/vim', as = 'dracula'}
use { 'navarasu/onedark.nvim', as = 'onedark' }
use { 'morhetz/gruvbox', as = 'gruvbox' }
use { 'nekonako/xresources-nvim', as = 'xresources' }

-- Navigation
use {'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'}
use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim',
                    'kyazdani42/nvim-web-devicons',
                    'nvim-lua/popup.nvim'}}

-- UI Inhancement    
use { 'MunifTanjim/nui.nvim' }
use { 'rcarriga/nvim-notify' }
use { 'sunjon/shade.nvim' }

-- Snippets
-- use { 'SirVer/ultisnips' }
-- use { 'honza/vim-snippets' }

-- Status Line
use { 'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}}

-- Tab Line
use { 'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}}

-- Tag Bar
use { 'preservim/tagbar' }

-- Undo Tree
use { 'mbbill/undotree' }

-- NodeJs Development
use { 'moll/vim-node' }

-- Auto Completion
use { 'jiangmiao/auto-pairs' }
use { 'neoclide/coc.nvim',
        branch = 'release'}
use { 'rafcamlet/coc-nvim-lua' }

-- Better Syntax Highlighting
use { 'nvim-treesitter/nvim-treesitter' }
use { 'pangloss/vim-javascript' }

-- Commenting
use { 'tpope/vim-commentary' }

-- Git Integration
use { 'airblade/vim-gitgutter' }
use { 'kdheepak/lazygit.nvim' }

-- Web Development
use { 'tpope/vim-surround' }
use { 'mattn/emmet-vim' }
use { 'alvan/vim-closetag' }
use { 'mg979/vim-visual-multi' }

-- Syntax Check
use { 'vim-syntastic/syntastic' }

-- Icon Packs
use { 'kyazdani42/nvim-web-devicons' }

end
        )
