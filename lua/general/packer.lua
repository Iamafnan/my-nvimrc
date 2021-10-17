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
use {'dracula/vim', as = 'dracula'}
use { 'folke/which-key.nvim' }
use { 'preservim/nerdtree' }

--  Telescope & Its Extentions
use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-lua/popup.nvim'}}
use { 'ahmedkhalf/project.nvim' }
use 'nvim-telescope/telescope-dap.nvim'

--  Icon Packs
use { 'kyazdani42/nvim-web-devicons' }
use { 'ryanoasis/vim-devicons' }

--  UI
use { 'hoob3rt/lualine.nvim' }
use { 'lukas-reineke/format.nvim' }
use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
use { 'rcarriga/nvim-notify' }
use { 'simrat39/symbols-outline.nvim' }
use { 'nvim-treesitter/nvim-treesitter' }
use { 'p00f/nvim-ts-rainbow'}
use { 'pangloss/vim-javascript' }
use { 'vim-syntastic/syntastic' }

--  Snippets
use { 'L3MON4D3/LuaSnip' }
use "saadparwaiz1/cmp_luasnip"
use { 'hrsh7th/vim-vsnip' }
use { 'hrsh7th/cmp-vsnip' }

--  Debug Adapter Protocol
use 'mfussenegger/nvim-dap'
use 'rcarriga/nvim-dap-ui'
use "Pocco81/DAPInstall.nvim"
use 'jbyuki/one-small-step-for-vimkind'

--  Quick Tasking
use { 'windwp/nvim-autopairs' }
use { 'tpope/vim-commentary' }
use { 'windwp/nvim-ts-autotag'}
use { 'mg979/vim-visual-multi' }
use { 'AndrewRadev/sideways.vim' }
use { 'tpope/vim-surround' }
use { 'moll/vim-node' }

--  Git
use { 'airblade/vim-gitgutter' }
use { 'kdheepak/lazygit.nvim' }

--  Language Server Protocol
use { 'neovim/nvim-lspconfig' }
use { 'onsails/lspkind-nvim' }
use { 'glepnir/lspsaga.nvim' }
use { 'ray-x/lsp_signature.nvim' }

--  CMP
use { 'hrsh7th/nvim-cmp' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/cmp-nvim-lua' }
use { 'octaltree/cmp-look' }
use { 'hrsh7th/cmp-calc' }

--  Java Development
use 'mfussenegger/nvim-jdtls'

end)
