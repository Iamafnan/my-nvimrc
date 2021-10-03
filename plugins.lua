vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

-- Colorschemes
use {'dracula/vim', as = 'dracula'}
use { 'navarasu/onedark.nvim', as = 'onedark' }
use { 'morhetz/gruvbox', as = 'gruvbox' }

-- Navigation
use {'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'}
use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim',
                    'kyazdani42/nvim-web-devicons',
                    'nvim-lua/popup.nvim'}}

-- Status Line
use { 'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}}

-- Tab Line
use { 'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}}

-- Auto Completion
use { 'jiangmiao/auto-pairs' }
use { 'neoclide/coc.nvim',
        branch = 'release'}

-- Better Syntax Highlighting
use { 'nvim-treesitter/nvim-treesitter' }

-- Commenting
use { 'tpope/vim-commentary' }

-- Git Integration
use { 'airblade/vim-gitgutter' }
use { 'kdheepak/lazygit.nvim' }

-- Web Development
use { 'tpope/vim-surround' }
use { 'mattn/emmet-vim' }
use { 'alvan/vim-closetag' }

-- Syntax Check
use { 'vim-syntastic/syntastic' }

-- Icon Packs
use { 'kyazdani42/nvim-web-devicons' }

end
        )
