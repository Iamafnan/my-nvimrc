vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

-- Colorschemes
use {'dracula/vim', as = 'dracula'}

-- Navigation
use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim',
                    'kyazdani42/nvim-web-devicons',
                    'nvim-lua/popup.nvim'}}

-- UI Inhancement    
use { 'rcarriga/nvim-notify' }
use { 'sunjon/shade.nvim' }

-- Snippets
use { 'L3MON4D3/LuaSnip' }
use "saadparwaiz1/cmp_luasnip"
use { 'hrsh7th/vim-vsnip' }
use { 'hrsh7th/cmp-vsnip' }

-- Status Line
use { 'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}}

-- Tab Line
use {'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'}

-- Tag Bar
use { 'preservim/tagbar' }

-- NodeJs Development
use { 'moll/vim-node' }

-- Auto Completion
use { 'jiangmiao/auto-pairs' }

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

-- Multi Cursor
use { 'mg979/vim-visual-multi' }

-- Syntax Check
use { 'vim-syntastic/syntastic' }

-- Icon Packs
use { 'kyazdani42/nvim-web-devicons' }

-- LSP
use { 'neovim/nvim-lspconfig' }
use { 'onsails/lspkind-nvim' }
use { 'ray-x/lsp_signature.nvim' }
use { 'hrsh7th/nvim-cmp' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/cmp-nvim-lua' }
use { 'octaltree/cmp-look' }
use { 'hrsh7th/cmp-calc' }
use { 'f3fora/cmp-spell' }

-- Quick Movemnet within buffer
use { 'AndrewRadev/sideways.vim' }

end
        )
