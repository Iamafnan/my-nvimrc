call plug#begin('$HOME/.config/nvim/autoload/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Status Line
Plug 'vim-airline/vim-airline'

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
Plug 'gko/vim-coloresque'

" Language Server
Plug 'neovim/nvim-lspconfig'

" Tabline
Plug 'romgrk/barbar.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
        
" Syntax Check
Plug 'vim-syntastic/syntastic'

" Auto Save
Plug 'vim-scripts/vim-auto-save'

" Terminal
Plug 'voldikss/vim-floaterm'

call plug#end()
