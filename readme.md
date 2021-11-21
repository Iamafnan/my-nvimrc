# My NeoVim Config

<img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white " />
<img src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white" />

## Preview

<img src="https://github.com/Iamafnan/my-nvimrc/blob/main/assets/screenshot1.jpg" />

## Quick Links

- [General Settings](https://github.com/Iamafnan/my-nvimrc/tree/main/lua/general)
- [LSP](https://github.com/Iamafnan/my-nvimrc/tree/main/lua/lsp)
- [UI Stuff](https://github.com/Iamafnan/my-nvimrc/tree/main/lua/ui)
- [Telescope](https://github.com/Iamafnan/my-nvimrc/tree/main/lua/telescope)

## Plugins

### Package Manager

- [Packer.nvim](https://github.com/wbthomason/packer.nvim): A plugin manager written in lua

### Tpope goodness

- [vim-surround](https://github.com/tpope/vim-surround): adds the missing motions (`ds`, `cs`, `ys`) for dealing with pairs of "surroundings" (quotes, tags, etc)
- [vim-commentary](https://github.com/tpope/vim-commentary): Comment any line or any paragraph

### Language Server Protocol

- [lspconfig](https://github.com/neovim/nvim-lspconfig): Configuration quickstart for nvim's built in LSP
- [lsp signature](https://github.com/ray-x/lsp_signature.nvim): LSP Signature help
- [E-Kaput](https://github.com/kaputi/e-kaput.nvim): Preview LSP Diagnostics in a floating window
- [vim-illuminate](https://github.com/RRethy/vim-illuminate): Vim plugin for automatically highlighting other uses of the word under the cursor

### Auto completion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua
- [cmp-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim builtin LSP client
- [cmp-lua](https://github.com/hrsh7th/cmp-nvim-lua): nvim-cmp source for neovim Lua API
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): nvim-cmp source for buffer words
- [cmp-path](https://github.com/hrsh7th/cmp-path): nvim-cmp source for filesystem paths
- [cmp-ultisnips](https://github.com/quangnguyen30192/cmp-nvim-ultisnips): Ultisnips support for nvim-cmp
- [cmp-under-comparator](https:/github.com/lukas-reineke/cmp-under-comparator): nvim-cmp comparator function for completion items that start with one or more underlines

### File tree

- [NERDTree](https://github.com/preservim/nerdtree): A tree explorer plugin for vim

### Fuzzy Finder and Project Management

- [Telescope](https://github.com/nvim-telescope/telescope.nvim): A fuzzy finder written in lua
- [Project.nvim](https://github.com/ahmedkhalf/project.nvim): The superior project management solution for neovim
- [Telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim): FZF sorter for telescope written in c

### Colorscheme

- [Dracula](https://github.com/dracula/dracula-theme): A dark theme for neovim

### and much more ...

### Directory Tree

```
├── init.lua
├── lua
    ├── general
    │   ├── autocommands.vim
    │   ├── disabled.lua
    │   ├── init.lua
    │   ├── mapping.lua
    │   ├── packer.lua
    │   ├── utils.lua
    │   └── settings.lua 
    ├── lsp
    │   ├── cmp.lua
    │   ├── diagnostics.lua
    │   ├── handlers.lua
    │   ├── illuminate-config.lua
    │   ├── kinds.lua
    │   ├── init.lua
    │   └── language-servers.lua
    ├── telescope-config
    │   ├── config.lua
    │   ├── extentions
    │   │   ├── fzf.lua
    │   │   ├── init.lua
    │   │   ├── neoclip.lua
    │   │   └── project-nvim.lua
    │   └── init.lua
    └── ui
        ├── dashboard.lua
        ├── git-signs.lua
        ├── colors.lua
        ├── init.lua
        ├── neoscroll.lua
        ├── nerdtree.lua
        ├── statusline.lua
        ├── tabline.lua
        └── treesitter
            ├── autopair.lua
            ├── config.lua
            └── init.lua

```
