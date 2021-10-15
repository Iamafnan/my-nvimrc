-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "                                                                            "
-- "            ____    _       _   _    ____   ___   _   _   ____              "
-- "           |  _ \  | |     | | | |  / ___| |_ _| | \ | | / ___|             "
-- "           | |_) | | |     | | | | | |  _   | |  |  \| | \___ \             "
-- "           |  __/  | |___  | |_| | | |_| |  | |  | |\  |  ___) |            "
-- "           |_|     |_____|  \___/   \____| |___| |_| \_| |____/             "
-- "                                                                            "              
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

--  Loaded First
use 'wbthomason/packer.nvim'
use 'lewis6991/impatient.nvim'
use {'dracula/vim', as = 'dracula'}
use { 'folke/which-key.nvim' }

--  Telescope & Its Extentions
use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-lua/popup.nvim'}}
use { 'ahmedkhalf/project.nvim' }

--  UI 
use 'tamton-aquib/staline.nvim'
use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
use { 'kyazdani42/nvim-web-devicons' }
use { 'rcarriga/nvim-notify' }
use { 'sunjon/shade.nvim' }
use { 'lukas-reineke/indent-blankline.nvim' }
use { 'nvim-treesitter/nvim-treesitter' }
use { 'pangloss/vim-javascript' }
use { 'vim-syntastic/syntastic' }

--  Snippets
use { 'L3MON4D3/LuaSnip' }
use "saadparwaiz1/cmp_luasnip"
use { 'hrsh7th/vim-vsnip' }
use { 'hrsh7th/cmp-vsnip' }

--  Quick Tasking
use { 'jiangmiao/auto-pairs' }
use { 'tpope/vim-commentary' }
use { 'mg979/vim-visual-multi' }
use { 'AndrewRadev/sideways.vim' }
use { 'alvan/vim-closetag' }
use { 'tpope/vim-surround' }
use { 'moll/vim-node' }

--  Git 
use { 'airblade/vim-gitgutter' }
use { 'kdheepak/lazygit.nvim' }

--  LSP
use { 'neovim/nvim-lspconfig' }
use { 'williamboman/nvim-lsp-installer' }
use { 'onsails/lspkind-nvim' }
use { 'glepnir/lspsaga.nvim' }
use { 'ray-x/lsp_signature.nvim' }
use { 'kosayoda/nvim-lightbulb' }
use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

--  CMP
use { 'hrsh7th/nvim-cmp' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/cmp-nvim-lua' }
use { 'octaltree/cmp-look' }
use { 'hrsh7th/cmp-calc' }
use { 'f3fora/cmp-spell' }

end
        )
