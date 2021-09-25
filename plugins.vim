call plug#begin('$HOME/.config/nvim/autoload/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Status Line
Plug 'vim-airline/vim-airline'

" Navigation
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Welcome Screen
Plug 'mhinz/vim-startify'

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Web Development
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Tabline
Plug 'romgrk/barbar.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
        
" Syntax Check
Plug 'vim-syntastic/syntastic'

call plug#end()
