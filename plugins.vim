call plug#begin('$HOME/.config/nvim/autoload/plugged')

" Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'

" Status Line
Plug 'hoob3rt/lualine.nvim'

" Navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

" Rest API Client
Plug 'NTBBloodbath/rest.nvim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Snippets
Plug 'honza/vim-snippets'

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
