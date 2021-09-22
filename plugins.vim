call plug#begin('$HOME/.config/nvim/autoload/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Status Line
Plug 'vim-airline/vim-airline'

" Navigation
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'

" Battery Integration
Plug 'lambdalisue/battery.vim'

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

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
Plug 'gko/vim-coloresque'

" Icons
Plug 'ryanoasis/vim-devicons'

" Whick Key
Plug 'liuchengxu/vim-which-key'

" Syntax Check
Plug 'vim-syntastic/syntastic'

" Auto Save
Plug 'vim-scripts/vim-auto-save'

" Terminal
Plug 'voldikss/vim-floaterm'

" Multi Cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

