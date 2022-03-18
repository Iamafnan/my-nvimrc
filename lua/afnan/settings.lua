local set = vim.opt

set.compatible = false
vim.cmd("set t_Co=256")

vim.cmd("colorscheme tokyonight ")

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

set.termguicolors = true

set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.fileencodings = "utf-8"

set.number = true
set.ruler = true

set.fillchars = {
	eob = " ",
}

set.showmode = false

set.signcolumn = "auto:1-2"

set.hidden = true
set.cmdheight = 1
set.backup = false
set.writebackup = false

set.completeopt = { "noinsert", "noselect", "menuone" }
set.wrap = false

set.title = true

set.clipboard = "unnamedplus"

set.autoindent = true
set.smartindent = true
set.shiftround = true
set.shiftwidth = 0
set.tabstop = 3

set.smarttab = true
set.expandtab = true

set.laststatus = 3
vim.cmd("hi WinSeparator guibg=none")

set.showtabline = 2

set.updatetime = 250

set.scrolloff = 14

set.splitright = true
set.splitbelow = true

set.formatoptions:remove("cro")
set.shortmess:append("c")
set.hlsearch = false

vim.g.node_host_prog = "/data/data/com.termux/files/usr/bin/neovim-node-host"
vim.g.loaded_perl_provider = false
vim.g.loaded_ruby_provider = false
vim.g.loaded_python2_provider = false
vim.g.loaded_python3_provider = false
