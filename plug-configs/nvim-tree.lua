vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '.github'}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_refresh_wait = 500
require'nvim-tree'.setup{
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = true,
        update_cwd = true,
        auto_closw = true,
        update_focused_file = {
        enable = false,
        update_cwd = false,
  },
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
  }
