call plug#begin('$HOME/.config/nvim/autoload/plugged')

" Themes
" Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'

" Status Line
Plug 'hoob3rt/lualine.nvim'

" Navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Auto Completion
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/completion-nvim'

" Rest API Client
Plug 'NTBBloodbath/rest.nvim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Web Development
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Tabline
Plug 'romgrk/barbar.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-web-devicons'
        
" Syntax Check
Plug 'vim-syntastic/syntastic'

" Which Key
Plug 'folke/which-key.nvim'

call plug#end()
