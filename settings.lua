local set = vim.opt

vim.cmd('set nocompatible')
vim.cmd('set t_Co=256')

vim.cmd('colorscheme onedark')

vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

set.termguicolors = true

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileencodings = 'utf-8'

set.number = true
set.ruler = true

set.cursorline = true

set.fillchars = {
      eob = ' '
}

set.showmode = false

set.hidden = true
set.cmdheight = 2
set.backup = false
set.writebackup = false

set.completeopt = { 'noinsert','noselect', 'menuone' }

set.clipboard = 'unnamedplus'

set.autoindent = true
set.smartindent = true
set.shiftround = true
set.shiftwidth = 8
set.tabstop = 3

set.smarttab = true
set.expandtab = true

set.laststatus = 2

set.showtabline = 2

set.updatetime = 300

set.scrolloff = 7
